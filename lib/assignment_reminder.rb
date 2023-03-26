require 'date'

class AssignmentReminder
    def initialize(assignments) # instance of the AssignmentManager
        @assignments = assignments
    end

    def current_time
        Date.new() # used to compare the task due date with the current time
    end

    def due_soon_reminder
        # returns a reminder when the task is due soon (2 days before)
        # iterate over hashed array with the due soon tasks
    end

    def ovedue_reminder
        # returns a reminder when the task is overdue (1 minute passed due)
        # iterate over the hashed array with past due tasks
    end
end