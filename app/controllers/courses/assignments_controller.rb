class Courses::AssignmentsController < ApplicationController

  before_action :set_course, only: [:new]

  def new
    @assignment = Assignment.new
    render layout: false
  end

  def create
    @assignment = Assignment.create(resource_params)
    render layout: false
  end

  private

  def resource_params
    params.require(:assignment).permit(:name, :course_id, :points, :order, :deadline)
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

end