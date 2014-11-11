class AddPublicAndExtraTestsBooleanToStudentToAssignment < ActiveRecord::Migration
  def change
    add_column :student_to_assignments, :public_test, :boolean, after: :achieved_points, default: false
    add_column :student_to_assignments, :extra_test, :boolean, after: :public_test, default: false
  end
end
