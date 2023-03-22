require "class_manager"

RSpec.describe ClassManager do
    xit "initializes with classes" do
        class_manager = ClassManager.new
        expect(class_manager).to eq "classes"
    end
end