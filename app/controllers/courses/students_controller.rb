class Courses::StudentsController < ApplicationController
  before_action :set_course, only: [:index]
  before_action :set_students, only: [:index]

  def index
    render layout: false
  end

  def create
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

  def set_students
    @students = @course.students
  end

end