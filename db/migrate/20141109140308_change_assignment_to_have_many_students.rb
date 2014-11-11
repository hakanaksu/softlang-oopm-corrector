class ChangeAssignmentToHaveManyStudents < ActiveRecord::Migration
  def change
    remove_column :assignments, :student_id
    add_column :assignments, :name, :string, after: :id
  end
end
