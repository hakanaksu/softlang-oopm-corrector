class Courses::SvnUpdatesController < ApplicationController

  before_action :set_course, only: [:update]

  def update
    @course.update_svn
  end

  private
  def set_course
    @course = Course.find(params[:course_id])
  end

end