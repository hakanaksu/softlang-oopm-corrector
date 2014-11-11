class Assignment < ActiveRecord::Base
  belongs_to :course
  has_many :student_to_assignments
  has_many :students, through: :student_to_assignments

  after_create :add_to_students

  def add_to_students
    self.course.students.each do |student|
      student.assignments << self
    end
  end

end
