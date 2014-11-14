class AddTutorCommentToStudentToAssignments < ActiveRecord::Migration
  def change
    add_column :student_to_assignments, :comment, :text, after: :encoding
  end
end
