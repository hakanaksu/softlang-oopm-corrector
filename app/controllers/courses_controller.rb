class CoursesController < ApplicationController

  before_action :set_course, only: [:destroy, :edit, :update]

  def index
    @courses = Course.all
    render layout: false
  end

  def new
    @course = Course.new
    render layout: false
  end

  def create
    @course = Course.create(resource_params)
  end

  def show
  end

  def edit
    render layout: false
  end

  def update
    @course.update(resource_params)
  end

  def destroy
    @course.destroy
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def resource_params
    params.require(:course).permit(:name, :start_date, :end_date, :max_points, :svn_url)
  end

end