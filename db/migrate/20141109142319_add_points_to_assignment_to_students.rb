class AddPointsToAssignmentToStudents < ActiveRecord::Migration
  def change
    add_column :student_to_assignments, :achieved_points, :integer, after: :student_id, default: 0
  end
end
