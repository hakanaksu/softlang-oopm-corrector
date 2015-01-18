class AddHomeWorkCommitted < ActiveRecord::Migration
  def change
    add_column :student_to_assignments, :homework_commited, :boolean, after: :solution_commited
  end
end
