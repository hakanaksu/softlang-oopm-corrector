class AddCourseToAssignment < ActiveRecord::Migration
  def change
    add_column :assignments, :course_id, :integer, after: :name
  end
end
