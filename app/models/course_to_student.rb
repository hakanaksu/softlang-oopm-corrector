class CourseToStudent < ActiveRecord::Base
  # === Relatins ===
  belongs_to :student
  belongs_to :course
end
