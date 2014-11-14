class AddEncodingToStudentsToAssignments < ActiveRecord::Migration
  def change
    add_column :student_to_assignments, :encoding, :boolean, after: :extra_test, default: true
  end
end
