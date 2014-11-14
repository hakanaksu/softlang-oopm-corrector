class Courses::Assignments::TestsController < ApplicationController

  before_action :set_course, only: [:index]
  before_action :set_assignment, only: [:index]

  def index
    current_user.students.each do |student|
      student.run_tests(@course, @assignment)
    end
    render layout: false
  end

  private


  def set_assignment
    @assignment = Assignment.find(params[:assignment_id])
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

end