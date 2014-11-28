class Student < ActiveRecord::Base
  # === Relations ===
  has_many :student_to_users
  has_many :users, through: :student_to_users
  has_many :course_to_students
  has_many :courses, through: :course_to_students
  has_many :student_to_assignments
  has_many :assignments, through: :student_to_assignments

  # === Callbacks ===
  def self.create_from_course_svn_folders(course, tutor)
    course.svn_student_folders.each do |name|
      Student.create(username: name, email: "#{name}@uni-koblenz.de", users: [tutor], courses: [course], assignments: course.assignments) unless (course.students.pluck(:username).include? name)
    end
  end

  def run_tests(course, assignment)
    assignment_for_student = self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id)
    if assignment_for_student.processing_status == StudentToAssignment::NOT_STARTED
      check_if_committed(course, assignment)
      compile_vector(course, assignment) if assignment.order == 4
      compile_functionality(course, assignment)
      compile_public_tests(course, assignment)
      compile_extra_tests(course, assignment)
      assignment_for_student.update(processing_status: StudentToAssignment::DONE)
    else
      true
    end
  end

  def check_if_committed(course, assignment)
    files = Dir.entries("#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}").reject { |file| file == '.' || file == '..' } rescue []
    if files.present?
      self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(solution_commited: true)
    end
  end

  def compile_vector(course, assignment)
    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Vector3.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Vector3.java"
  end

  def compile_functionality(course, assignment)
    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Functionality.class"
    encodingcorrect = system "javac #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Functionality.java"
    unless encodingcorrect
      system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Functionality.java"
      self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(encoding: false)
    end

  end

  def compile_public_tests(course, assignment)
    system "rm #{Rails.root}/lib/public_tests/#{assignment.order}/PublicTests.class"
    system "javac #{Rails.root}/lib/public_tests/#{assignment.order}/PublicTests.java -cp #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}:#{Rails.root}/lib/jars/junit.jar"
    compile_result = Timeout::timeout(60) {
      system "cd #{Rails.root}/lib/public_tests/#{assignment.order} && java -cp #{Rails.root}/lib/jars/junit.jar:#{Rails.root}/lib/jars/hamcrest-core-1.3.jar:#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}:. org.junit.runner.JUnitCore PublicTests"
    } rescue false
    self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(public_test: compile_result)


  end

  def compile_extra_tests(course, assignment)
    system "rm #{Rails.root}/lib/extra_tests/#{assignment.order}/ExtraTests.class"
    system "javac #{Rails.root}/lib/extra_tests/#{assignment.order}/ExtraTests.java -cp #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}:#{Rails.root}/lib/jars/junit.jar"
    compile_result = Timeout::timeout(60) {
      system "cd #{Rails.root}/lib/extra_tests/#{assignment.order} && java -cp #{Rails.root}/lib/jars/junit.jar:#{Rails.root}/lib/jars/hamcrest-core-1.3.jar:#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}:. org.junit.runner.JUnitCore ExtraTests"
    } rescue false
    self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(extra_test: compile_result)
  end

end
