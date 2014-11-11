class CreateStudentToAssignments < ActiveRecord::Migration
  def change
    create_table :student_to_assignments do |t|
      t.references :assignment, index: true
      t.references :student, index: true

      t.timestamps
    end
  end
end
