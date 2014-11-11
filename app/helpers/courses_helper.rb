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
end