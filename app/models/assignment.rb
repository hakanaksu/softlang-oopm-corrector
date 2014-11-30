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
    <<EOF
Sehr geehrter Student mit der Kennung #{student.username},

Sie haben in der Aufgabe #{assignment.order} folgende Punktzahlen erreicht:
---
Hausaufgabe: #{points_homework} / 2
Programmieraufgabe: #{points_programming} / 3
---
Kommentare:
#{comment}

Korrektor: #{user.email}

Mit freundlichen Grüßen
OOPM-Team

EOF
  end

end
