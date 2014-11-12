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

end
