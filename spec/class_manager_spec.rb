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
        expect(class_manager.format_class_display).to eq "1. History, 23-03-2023,\n2. Geography, 24-03-2023"
    end

    context "given a user adds a class that is not part of the class list" do
        it "returns an error and re-asks to choose right class" do
            io = double :io
            expect(io).to receive(:puts).with("Please enter the classes you want to add, when done type \"done\"")
            expect(io).to receive(:gets).and_return("Art")
            expect(io).to receive(:puts).with("That's not one of your classes. Please enter a valid class: ")
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
            expect(class_manager.format_class_display).to eq "1. History, 23-03-2023,\n2. Geography, 24-03-2023"
        end
    end

    context "given a user adds a class date that is invalid format" do
        it "returns an error and re-asks to choose right date format" do
            io = double :io
            expect(io).to receive(:puts).with("Please enter the classes you want to add, when done type \"done\"")
            expect(io).to receive(:gets).and_return("History")
            expect(io).to receive(:puts).with("Please enter the date of the class in format DD-MM-YYYY")
            expect(io).to receive(:gets).and_return("Next Week")
            expect(io).to receive(:puts).with("Invalid date format. Please enter a date in the format DD-MM-YYYY")
            expect(io).to receive(:gets).and_return("24-03-2023")
            expect(io).to receive(:puts).with("Please enter the classes you want to add, when done type \"done\"")
            expect(io).to receive(:gets).and_return("Geography")
            expect(io).to receive(:puts).with("Please enter the date of the class in format DD-MM-YYYY")
            expect(io).to receive(:gets).and_return("25-03-2023")
            expect(io).to receive(:puts).with("Please enter the classes you want to add, when done type \"done\"")
            expect(io).to receive(:gets).and_return("done")
            expect(io).to receive(:puts).with("Your classes have been added.")
    
            class_manager = ClassManager.new(io)
            class_manager.add_class
            expect(class_manager.format_class_display).to eq "1. History, 24-03-2023,\n2. Geography, 25-03-2023"
        end
    end

    it "deletes a class from the class list at users request" do
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
    end
end