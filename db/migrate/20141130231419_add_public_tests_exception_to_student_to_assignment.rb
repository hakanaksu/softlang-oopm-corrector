class AddPublicTestsExceptionToStudentToAssignment < ActiveRecord::Migration
  def change
    add_column :student_to_assignments, :public_test_exception, :text, after: :public_test
    add_column :student_to_assignments, :extra_test_exception, :text, after: :public_test_exception
  end
end
