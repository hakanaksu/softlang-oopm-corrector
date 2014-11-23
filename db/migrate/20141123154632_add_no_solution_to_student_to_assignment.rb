class AddNoSolutionToStudentToAssignment < ActiveRecord::Migration
  def change
    add_column :student_to_assignments, :solution_commited, :boolean, after: :processing_status, default: false
  end
end
