module LandingPagesHelper

  def student_points(student)
    student.student_to_assignments.inject(0) do |sum, element|
      sum += (element.achieved_points + element.achieved_points_programming) rescue sum += 0
    end
  end

  def course_progress(student, course)
    (student_points(student) / course.max_points.to_f) * 100 rescue 0
  end

end
