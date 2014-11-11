class CreateAssignments < ActiveRecord::Migration
  def change
    create_table :assignments do |t|
      t.integer :points
      t.references :student, index: true
      t.integer :order
      t.date :deadline

      t.timestamps
    end
  end
end
