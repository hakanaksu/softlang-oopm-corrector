class CreateStudentToUsers < ActiveRecord::Migration
  def change
    create_table :student_to_users do |t|
      t.references :user, index: true
      t.references :student, index: true

      t.timestamps
    end
  end
end
