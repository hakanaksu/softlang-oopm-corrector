class CreateStudents < ActiveRecord::Migration
  def change
    create_table :students do |t|
      t.string :username
      t.string :email
      t.references :user, index: true

      t.timestamps
    end
  end
end
