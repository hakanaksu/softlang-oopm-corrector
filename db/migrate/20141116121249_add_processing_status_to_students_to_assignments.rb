class AddProcessingStatusToStudentsToAssignments < ActiveRecord::Migration
  def change
    add_column :student_to_assignments, :processing_status, :string, after: :comment, default: 'not_started'
  end
end
