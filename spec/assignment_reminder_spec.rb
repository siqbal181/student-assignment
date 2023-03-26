require "assignment_reminder"

RSpec.describe AssignmentManager do
    it "shows the list of assignments which are due soon" do
    assignment_manager = double :assignment_manager
    expect(assignment_manager).to receive(:format_assignment_display).and_return("1. History Paper, 25-03-2023,\n2. Geography Essay, 26-03-2023")

    assignment_reminder = AssignmentReminder.new(assignment_manager)
    expect(assignment_reminder.due_soon_reminder).to eq("You have some assignments due soon:\nGeography Paper - Due in 13 hours")
    end
end