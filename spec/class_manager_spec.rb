require "class_manager"

RSpec.describe ClassManager do
    it "initializes with classes" do
        io = double :io
        class_manager = ClassManager.new(io)
        expect(class_manager.format_class_display).to eq ""
    end

    it "adds classes to the class array" do
        io = double :io
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

        class_manager = ClassManager.new(io)
        class_manager.add_class
        expect(class_manager.format_class_display).to eq "History, 23-03-2023,\nGeography, 24-03-2023"
    end
end