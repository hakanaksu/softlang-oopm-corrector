class AddProgrammingPointsToStudentToAssignment < ActiveRecord::Migration
  def change
    add_column :student_to_assignments, :achieved_points_programming, :integer, after: :achieved_points, default: 0
  end
end
