class CreateCourseToStudents < ActiveRecord::Migration
  def change
    create_table :course_to_students do |t|
      t.references :student, index: true
      t.references :course, index: true

      t.timestamps
    end
  end
end
