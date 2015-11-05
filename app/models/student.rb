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
    check_if_homework_committed(course, assignment)
  end

  def check_if_homework_committed(course, assignment)
    files = Dir.entries("#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}").reject { |file| file == '.' || file == '..' }.map { |file| File.extname(file) }.uniq rescue []
    (files.include? '.pdf') ? self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(homework_commited: true) : self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(homework_commited: false)
  end

  def compile_iterator(course, assignment)
    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/TreeNodeIterator.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/TreeNodeIterator.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/TreeNode.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/TreeNode.java"
  end

  def compile_typesystem(course, assignment)
    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Attribute.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Attribute.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Boolean.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Boolean.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/CharArray.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/CharArray.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Class.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Class.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Default.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Default.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Integer.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Integer.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Interface.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Interface.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Javafile.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Javafile.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Method.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Method.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Private.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Private.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Protected.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Protected.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Public.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Public.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Type.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Type.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Typeable.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Typeable.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Visibility.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Visibility.java"

  end

  def compile_person(course, assignment)
    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Angestellter.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Angestellter.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/GeschaeftsKunde.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/GeschaeftsKunde.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Kunde.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Kunde.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Manager.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Manager.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Person.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Person.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/PrivatKunde.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/PrivatKunde.java"

    # ===

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src/Angestellter.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src/Angestellter.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/GeschaeftsKunde.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/srcGeschaeftsKunde.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Kunde.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src/Kunde.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Manager.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src/Manager.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Person.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src/Person.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/PrivatKunde.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src/PrivatKunde.java"
  end

  def compile_bin_int_tree(course, assignment)
    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/TreeException.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/TreeException.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src/TreeException.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src/TreeException.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src/BinIntTree.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src/BinIntTree.java"
  end

  def compile_cyclic_list(course, assignment)
    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/CycleListElement.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/CycleListElement.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/CycleList.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/CycleList.java"
  end

  def compile_monoid(course, assignment)
    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Monoid.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Monoid.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/MultMonoid.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/MultMonoid.java"

    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/SumMonoid.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/SumMonoid.java"
  end

  def compile_vector(course, assignment)
    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Vector3.class"
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Vector3.java"
  end

  def compile_functionality(course, assignment)
    begin
      system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Functionality.class"
      encodingcorrect = File.read("#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Functionality.java").encoding == Encoding.find('UTF-8')
      system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/Functionality.java"
      self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(encoding: encodingcorrect)
    rescue
      compile_functioanlity_in_src(course, assignment)
    end
  end

  def compile_functioanlity_in_src(course, assignment)
    system "rm #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src/Functionality.class"
    encodingcorrect = File.read("#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src/Functionality.java").encoding == Encoding.find('UTF-8') rescue false
    system "javac -encoding UTF-8 #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src/Functionality.java"
    self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(encoding: encodingcorrect)
  end

  def compile_public_tests(course, assignment)
    system "rm #{Rails.root}/lib/public_tests/#{assignment.order}/PublicTests.class"
    system "javac #{Rails.root}/lib/public_tests/#{assignment.order}/PublicTests.java -cp #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}:#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src:#{Rails.root}/lib/jars/junit.jar"
    compile_text = ''
    compile_result = Timeout::timeout(120) {
      compile_text = %x{cd #{Rails.root}/lib/public_tests/#{assignment.order} && java -cp #{Rails.root}/lib/jars/junit.jar:#{Rails.root}/lib/jars/hamcrest-core-1.3.jar:#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}:#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src:. org.junit.runner.JUnitCore PublicTests}
      system "cd #{Rails.root}/lib/public_tests/#{assignment.order} && java -cp #{Rails.root}/lib/jars/junit.jar:#{Rails.root}/lib/jars/hamcrest-core-1.3.jar:#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}:#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src:. org.junit.runner.JUnitCore PublicTests"
    } rescue false
    self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(public_test: compile_result)
    self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(public_test_exception: compile_text) rescue self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(public_test_exception: 'Console Output too long for database. Sorry.')
  end

  def compile_extra_tests(course, assignment)
    system "rm #{Rails.root}/lib/extra_tests/#{assignment.order}/ExtraTests.class"
    system "javac #{Rails.root}/lib/extra_tests/#{assignment.order}/ExtraTests.java -cp #{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}:#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src:#{Rails.root}/lib/jars/junit.jar"
    compile_text = ''
    compile_result = Timeout::timeout(60) {
      compile_text = %x{cd #{Rails.root}/lib/extra_tests/#{assignment.order} && java -cp #{Rails.root}/lib/jars/junit.jar:#{Rails.root}/lib/jars/hamcrest-core-1.3.jar:#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}:#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src:. org.junit.runner.JUnitCore ExtraTests}
      system "cd #{Rails.root}/lib/extra_tests/#{assignment.order} && java -cp #{Rails.root}/lib/jars/junit.jar:#{Rails.root}/lib/jars/hamcrest-core-1.3.jar:#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}/src:#{Rails.root}/repos/#{course.id}/#{self.username}/solutions/#{assignment.order}:. org.junit.runner.JUnitCore ExtraTests"
    } rescue false
    self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(extra_test: compile_result)
    self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(extra_test_exception: compile_text) rescue self.student_to_assignments.find_by(student_id: self.id, assignment_id: assignment.id).update(extra_test_exception: 'Console Output too long for database. Sorry.')
  end

  def homework_admission_completed?
    (self.student_to_assignments.pluck(:achieved_points).select { |element| element >= 1 }.inject(:+) / 20.0) >= 0.66 rescue false
  end

  def homework_admission_completed_two?
    (self.student_to_assignments.pluck(:achieved_points).select { |element| element >= 2 }.inject(:+) / 20.0) >= 0.33 rescue false
  end

  def programming_admission_completed?
    (self.student_to_assignments.pluck(:achieved_points_programming).select { |element| element >= 2 }.inject(:+) / 30.0) >= 0.66 rescue false
  end

end
