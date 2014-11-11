class Courses::SvnStudentsController < ApplicationController

  before_action :set_course, only: [:create]

  def create
    Student.create_from_course_svn_folders(@course, current_user)
  end

  private

  def set_course
    @course = Course.find(params[:course_id])
  end

end