# {{PROBLEM}} Multi-Class Planned Design Recipe

## 1. Describe the Problem

_Put or write the user story here. Add any clarifying notes you might have._

> As a student
> So that I can keep track of my classes and assignments
> I would like to see a calendar that displays all of my classes and assignment due dates.

> As a student
> So that I can manage my time effectively
> I would like to be able to add, edit, and delete classes and assignments from the calendar.

> As a student
> So that I can ensure that I am meeting all of my deadlines
> I would like to receive reminders when an assignment is due soon, and when it is overdue.

## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```ruby

class ClassManager
    def initialize
        @classes = [
            {class: "History", date: "date"},
            {class: "Geography", date: "date"},
            {class: "Science", date: "date"},
        ]
    end

    def add_class(class) # class is a string
        # returns nothing
        # adds class to the @classes hash array
        # ask the date of the class
    end

    def delete_class(class) # class is a string
        # returns nothing
        # remotes class from the @classes hash array
    end

    def format_class_display
        # formats the class display for the calendar class to use
    end
end

class AssignmentManager
    def initialize
        @assignments = [
            {assignment: "History Paper", due_date: "date"},
            {assignment: "Math Test", due_date: "date"},
            {assignment: "Science Project", due_date: "date"},
        ]
    end

    def add_assignment
        # returns nothing
        # adds assignment to the @assignment hash array
        # making due to ask separately the assignment and due date
    end

    def delete_assignment
        # returns nothing
        # remotes assignment from the @assignment hash array
    end

    def format_assignment_display
        # formats the assignment display for the calendar class to use
        # ensure to clearly tie due_date to it for AssignmentReminder
    end
end

class Calendar
    def initialize(classes, assignments)
        @classes = classes # instance of the ClassManager
        @assignments = assignments # instance of the AssignmentManager
    end

    def display_classes
        # returns a formatted view of the classes
    end

    def display_assignments
        # returns a formatted view of the assignments
    end
end

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


```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

# ClassManager to Calendar
# It adds a class to the classes list and the calendar shows the classes
# class_manager = ClassManager.new
# class_manager.add_class("History")
# # class_manager.add_class("Geography")

# calendar = Calendar.new
# expect(calendar.display_classes).to eq "class: History, class: Geography"

# # # AssignmentManager to Calendar
# # # Add assignment to the assignment list and the calendar shows the assignments
# # assignment_manager = ClassManager.new
# # assignment_manager.add_assignment("History Paper")
# # assignment_manager.add_assignment("Geography Essay") # when is it due?

# calendar = Calendar.new
# expect(calendar.display_assignments).to eq "History Paper", "Geography Essay"

# # It deletes a class from class list and calendar shows updated classes
# class_manager = ClassManager.new
# class_manager.add_class("History")
# class_manager.add_class("Geography")
# class_manager.delete_class("History")

# calendar = Calendar.new
# expect(calendar.display_classes).to eq "class: \"History\" Date: 03/07/2023"

# It deletes a assignment from assignment list and calendar shows updated assignments
assignment_manager = ClassManager.new
assignment_manager.add_assignment("History Paper")
assignment_manager.add_assignment("Geography Essay") # when is it due?
class_manager.delete_assignment("History Paper")

calendar = Calendar.new
expect(calendar.display_assignments).to eq "Geography Essay"

# Assignment Reminder
# It shows the list of assignments which are due soon
assignment_manager = ClassManager.new
assignment_manager.add_assignment("History Paper", 30/03/2023)
assignment_manager.add_assignment("Geography Paper", 23/03/2023)

assignment_reminder = AssignmentReminder.new(assignment_manager)
expect(assignment_reminder.due_soon_reminder).to eq("You have some assignments due soon:\nGeography Paper - Due in 13 hours")

# It shows the list of assignments which are ocer
assignment_manager = ClassManager.new
assignment_manager.add_assignment("History Paper", 30/03/2023)
assignment_manager.add_assignment("Geography Paper", 21/03/2023)

assignment_reminder = AssignmentReminder.new(assignment_manager)
expect(assignment_reminder.overdue_reminder).to eq("You have some assignments which are overdue:\nGeography Paper - 13 hours late")

```

## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby

# # Class Manager
# # It shows a formatted list of classes once added
# class_manager = ClassManager.new
# class_manager.add_class("History")
# class_manager.add_class("Geography")
# expect(class_manager.format_class_display).to eq("History, Geography")

# # Assignment Manager
# # It shows a formatted list of assignments once added
# assignment_manager = ClassManager.new
# assignment_manager.add_assignment("History Paper")
# assignment_manager.add_assignment("Geography Essay") # when is it due?
# expect(assignment_manager.format_assignment_display).to eq("History Paper", "Geography Essay")


```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._