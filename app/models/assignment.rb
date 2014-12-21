class Assignment < ActiveRecord::Base
  # === Relations ===
  belongs_to :course
  has_many :student_to_assignments
  has_many :students, through: :student_to_assignments

  # === Callbacks ===
  after_create :add_to_students

  # === Methods ===
  def add_to_students
    self.course.students.each do |student|
      student.assignments << self
    end
  end

  def self.generate_comment(points_homework, points_programming, comment, user, student, assignment)
    ac = ApplicationController.new
    ac.instance_variable_set("@student", student)
    ac.instance_variable_set("@assignment", assignment)
    ac.instance_variable_set("@course", assignment.course)
    ac.instance_variable_set("@user", user)
    ac.instance_variable_set("@comment", comment)
    ac.instance_variable_set("@points_homework", points_homework)
    ac.instance_variable_set("@points_programming", points_programming)
    pdf = ac.render_to_string(pdf: "the_pdf_filename", template: 'comments/show')


    save_path = Rails.root.join('pdfs', "comment_course_#{assignment.course.name}_ass_#{assignment.order}_student_#{student.username}.pdf")
    File.open(save_path, 'wb') do |file|
      file << pdf
    end
    save_path
  end

end
