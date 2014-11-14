module CoursesHelper

  def course_svn_status_label(course)
    case course.svn_status
      when 'not_checked_out'
        'label label-warning'
      when 'checked_out'
        'label label-success'
      else
        'label label-danger'
    end
  end

  def course_svn_status_text(course)
    case course.svn_status
      when 'not_checked_out'
        'Nicht ausgecheckt'
      when 'checked_out'
        "Ausgecheckt (#{course.revision_number})"
      else
        'Unbekannt'
    end
  end

  def tests_success(students, public_tests=true)
    students.map do |student|
      student.student_to_assignments
    end.flatten.map do |student_to_assignment|
      if public_tests
        student_to_assignment.public_test
      else
        student_to_assignment.extra_test
      end
    end.inject(0) do |sum, element|
      element ? sum = sum + 1 : sum = sum + 0
    end
  end

  def tests_failed(students, public_tests=true)
    students.map do |student|
      student.student_to_assignments
    end.flatten.map do |student_to_assignment|
      if public_tests
        student_to_assignment.public_test
      else
        student_to_assignment.extra_test
      end
    end.inject(0) do |sum, element|
      element ? sum = sum + 0 : sum = sum + 1
    end
  end

  def test_status_public_test(student, assignment)
    student.student_to_assignments.find_by(student_id: student.id, assignment_id: assignment.id).public_test
  end

  def test_status_extra_test(student, assignment)
    student.student_to_assignments.find_by(student_id: student.id, assignment_id: assignment.id).extra_test
  end

  def test_status_encoding(student, assignment)
    student.student_to_assignments.find_by(student_id: student.id, assignment_id: assignment.id).encoding
  end

  def comment_given?(student, assignment)
    student.student_to_assignments.find_by(student_id: student.id, assignment_id: assignment.id).comment.present?
  end
end