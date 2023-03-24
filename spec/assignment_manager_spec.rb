require "assignment_manager"

RSpec.describe AssignmentManager do
    it "adds an assignment to the assignment list" do
        io = double :io
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

        assignment_manager = AssignmentManager.new(io)
        assignment_manager.add_assignment
        expect(assignment_manager.format_assignment_display).to eq "1. History Paper, 25-03-2023,\n2. Geography Essay, 26-03-2023"
    end

    context "given a user adds a assignment date that is invalid format" do
        it "returns an error and re-asks to choose right date format" do
            io = double :io
            expect(io).to receive(:puts).with("Please enter the assignment you want to add, when done type \"done\"")
            expect(io).to receive(:gets).and_return("History Paper")
            expect(io).to receive(:puts).with("Please enter the date of the assignment in format DD-MM-YYYY")
            expect(io).to receive(:gets).and_return("Next Week")
            expect(io).to receive(:puts).with("Invalid date format. Please enter a date in the format DD-MM-YYYY")
            expect(io).to receive(:gets).and_return("25-03-2023")
            expect(io).to receive(:puts).with("Please enter the assignment you want to add, when done type \"done\"")
            expect(io).to receive(:gets).and_return("Geography Essay")
            expect(io).to receive(:puts).with("Please enter the date of the assignment in format DD-MM-YYYY")
            expect(io).to receive(:gets).and_return("26-03-2023")
            expect(io).to receive(:puts).with("Please enter the assignment you want to add, when done type \"done\"")
            expect(io).to receive(:gets).and_return("done")
            expect(io).to receive(:puts).with("Your assignments have been added.")
    
            assignment_manager = AssignmentManager.new(io)
            assignment_manager.add_assignment
            expect(assignment_manager.format_assignment_display).to eq "1. History Paper, 25-03-2023,\n2. Geography Essay, 26-03-2023"
        end
    end

    it "deletes an assignment from the assignment list at users request" do
        io = double :io
        expect(io).to receive(:puts).with("Please enter the assignment you want to add, when done type \"done\"")
        expect(io).to receive(:gets).and_return("History Paper")
        expect(io).to receive(:puts).with("Please enter the date of the assignment in format DD-MM-YYYY")
        expect(io).to receive(:gets).and_return("25-03-2023")
        expect(io).to receive(:puts).with("Please enter the assignment you want to add, when done type \"done\"")
        expect(io).to receive(:gets).and_return("Geography Essay")
        expect(io).to receive(:puts).with("Please enter the date of the assignment in format DD-MM-YYYY")
        expect(io).to receive(:gets).and_return("27-03-2023")
        expect(io).to receive(:puts).with("Please enter the assignment you want to add, when done type \"done\"")
        expect(io).to receive(:gets).and_return("done")
        expect(io).to receive(:puts).with("Your assignments have been added.")
        
        expect(io).to receive(:puts).with("Type the number of the assignment you want to delete. Type \"done\" when complete.")
        expect(io).to receive(:puts).with("1. History Paper, 25-03-2023,\n2. Geography Essay, 27-03-2023")
        expect(io).to receive(:gets).and_return("1")
        expect(io).to receive(:puts).with("This assignment has been deleted. Here is your assignment list: ")
        expect(io).to receive(:puts).with("1. Geography Essay, 27-03-2023")
        expect(io).to receive(:puts).with("Type the number of the assignment you want to delete. Type \"done\" when complete.")
        expect(io).to receive(:gets).and_return("done")
        expect(io).to receive(:puts).with("1. Geography Essay, 27-03-2023")
  
        assignment_manager = AssignmentManager.new(io)
        assignment_manager.add_assignment
        assignment_manager.delete_assignment
    end
end
