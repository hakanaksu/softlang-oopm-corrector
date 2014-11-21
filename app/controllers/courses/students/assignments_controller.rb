class Courses::Students::AssignmentsController < ApplicationController

  before_action :set_course, only: [:edit, :update]
  before_action :set_student, only: [:edit, :update]
  before_action :set_assignment, only: [:edit, :update]
  before_action :set_achieved_points, only: [:edit]
  # GET /courses/:course_id/students/:student_id/assignments/:id/edit
  def edit
    @student.run_tests(@course, @assignment)
    @student_to_assign
    @public_test = @student.student_to_assignments.find_by(assignment_id: @assignment.id, student_id: @student.id).public_test
    @extra_test = @student.student_to_assignments.find_by(assignment_id: @assignment.id, student_id: @student.id).extra_test
    @encoding = @student.student_to_assignments.find_by(assignment_id: @assignment.id, student_id: @student.id).encoding
    render layout: false
  end

  def update
    @student_to_assignment = @student.student_to_assignments.find_by(assignment_id: @assignment.id, student_id: @student.id)
    comment_template = Assignment.generate_comment(params[:achieved_points], params[:achieved_points_programming], params[:comment], current_user, @student, @assignment)
    @student_to_assignment.update(achieved_points: params[:achieved_points], achieved_points_programming: params[:achieved_points_programming], comment: comment_template)
    @course.commit_comment(@student.username, @assignment.order, comment_template)
    render layout: false
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_student
    @student = Student.find(params[:student_id])
  end

  def set_assignment
    @assignment = Assignment.find(params[:id])
  end

  def set_achieved_points
    @achieved_points = @student.student_to_assignments.find_by(assignment_id: @assignment.id, student_id: @student.id).achieved_points
    @achieved_points_programming = @student.student_to_assignments.find_by(assignment_id: @assignment.id, student_id: @student.id).achieved_points_programming
  end

end