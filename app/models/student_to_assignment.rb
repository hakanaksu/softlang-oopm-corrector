class StudentToAssignment < ActiveRecord::Base
  belongs_to :assignment
  belongs_to :student

  PROCESSING_STATUS = [NOT_STARTED = 'not_started', DONE = 'done']
end
