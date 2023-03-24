class Calendar
    def initialize(classes, assignments)
        @classes = classes # instance of the ClassManager
        @assignments = assignments # instance of the AssignmentManager
    end

    def display_classes
        return @classes.format_class_display
    end

    def display_assignments
        return @assignments.format_assignment_display
    end
end