require "calendar"
require "class_manager"
require "assignment_manager"

RSpec.describe "integration test" do
    it "displays a list of classes the student has" do
        io = double :io
        assignment_manager = double :assignment_manager
        expect(io).to receive(:puts).with("Please enter the classes you want to add, when done type \"done\"")
        expect(io).to receive(:gets).and_return("History")
        expect(io).to receive(:puts).with("Please enter the date of the class in format DD-MM-YYYY")
        expect(io).to receive(:gets).and_return("23-03-2023")
        expect(io).to receive(:puts).with("Please enter the classes you want to add, when done type \"done\"")
        expect(io).to receive(:gets).and_return("done")
        expect(io).to receive(:puts).with("Your classes have been added.")
        # add a class and go through adding a single class to the list along with date
        # initialize the calendar
        class_manager = ClassManager.new(io)
        class_manager.add_class
        calendar = Calendar.new(class_manager, assignment_manager)
        expect(calendar.display_classes).to eq "1. History, 23-03-2023"
    end

    it "displays a list of assignments the student has" do
        io = double :io
        class_manager = double :class_manager
        expect(io).to receive(:puts).with("Please enter the assignment you want to add, when done type \"done\"")
        expect(io).to receive(:gets).and_return("History Paper")
        expect(io).to receive(:puts).with("Please enter the date of the assignment in format DD-MM-YYYY")
        expect(io).to receive(:gets).and_return("25-03-2023")
        expect(io).to receive(:puts).with("Please enter the assignment you want to add, when done type \"done\"")
        expect(io).to receive(:gets).and_return("done")
        expect(io).to receive(:puts).with("Your assignments have been added.")

        assignment_manager = AssignmentManager.new(io)
        assignment_manager.add_assignment
        calendar = Calendar.new(class_manager, assignment_manager)
        expect(assignment_manager.format_assignment_display).to eq "1. History Paper, 25-03-2023"
    end

    context "given some classes are first added and then shown on calendar, but later a class is deleted" do
        it "updates the calendar to show the correct amount of classes" do
            io = double :io
            assignment_manager = double :assignment_manager

            expect(io).to receive(:puts).with("Please enter the classes you want to add, when done type \"done\"")
            expect(io).to receive(:gets).and_return("History")
            expect(io).to receive(:puts).with("Please enter the date of the class in format DD-MM-YYYY")
            expect(io).to receive(:gets).and_return("23-03-2023")
            expect(io).to receive(:puts).with("Please enter the classes you want to add, when done type \"done\"")
            expect(io).to receive(:gets).and_return("Geography")
            expect(io).to receive(:puts).with("Please enter the date of the class in format DD-MM-YYYY")
            expect(io).to receive(:gets).and_return("24-03-2023")
            expect(io).to receive(:puts).with("Please enter the classes you want to add, when done type \"done\"")
            expect(io).to receive(:gets).and_return("done")
            expect(io).to receive(:puts).with("Your classes have been added.")
            expect(io).to receive(:puts).with("Type the number of the class you want to delete. Type \"done\" when complete.")
            expect(io).to receive(:puts).with("1. History, 23-03-2023,\n2. Geography, 24-03-2023")
            expect(io).to receive(:gets).and_return("1")
            expect(io).to receive(:puts).with("This class has been deleted. Here is your class list: ")
            expect(io).to receive(:puts).with("1. Geography, 24-03-2023")
            expect(io).to receive(:puts).with("Type the number of the class you want to delete. Type \"done\" when complete.")
            expect(io).to receive(:gets).and_return("done")
            expect(io).to receive(:puts).with("1. Geography, 24-03-2023")
            class_manager = ClassManager.new(io)
            class_manager.add_class
            class_manager.delete_classes
            calendar = Calendar.new(class_manager, assignment_manager)
            expect(calendar.display_classes).to eq "1. Geography, 24-03-2023"
        end
    end

    context "given some assignments are first added and then shown on calendar, but later an assignment is deleted" do
        it "updates the calendar to show the correct amount of assignments" do
            io = double :io
            class_manager = double :class_manager

            expect(io).to receive(:puts).with("Please enter the assignment you want to add, when done type \"done\"")
            expect(io).to receive(:gets).and_return("History Paper")
            expect(io).to receive(:puts).with("Please enter the date of the assignment in format DD-MM-YYYY")
            expect(io).to receive(:gets).and_return("25-03-2023")
            expect(io).to receive(:puts).with("Please enter the assignment you want to add, when done type \"done\"")
            expect(io).to receive(:gets).and_return("Geography Essay")
            expect(io).to receive(:puts).with("Please enter the date of the assignment in format DD-MM-YYYY")
            expect(io).to receive(:gets).and_return("26-03-2023")
            expect(io).to receive(:puts).with("Please enter the assignment you want to add, when done type \"done\"")
            expect(io).to receive(:gets).and_return("done")
            expect(io).to receive(:puts).with("Your assignments have been added.")

            expect(io).to receive(:puts).with("Type the number of the assignment you want to delete. Type \"done\" when complete.")
            expect(io).to receive(:puts).with("1. History Paper, 25-03-2023,\n2. Geography Essay, 26-03-2023")
            expect(io).to receive(:gets).and_return("1")
            expect(io).to receive(:puts).with("This assignment has been deleted. Here is your assignment list: ")
            expect(io).to receive(:puts).with("1. Geography Essay, 26-03-2023")
            expect(io).to receive(:puts).with("Type the number of the assignment you want to delete. Type \"done\" when complete.")
            expect(io).to receive(:gets).and_return("done")
            expect(io).to receive(:puts).with("1. Geography Essay, 26-03-2023")

            assignment_manager = AssignmentManager.new(io)
            assignment_manager.add_assignment
            assignment_manager.delete_assignment
            calendar = Calendar.new(class_manager, assignment_manager)
            expect(calendar.display_assignments).to eq "1. Geography Essay, 26-03-2023"
        end
    end
end


