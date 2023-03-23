require 'date'

class ClassManager
    def initialize(io)
        @io = io
        @classes = []
        @class_list = ["History", "Geography", "Maths", "English", "Spanish", "Science"]
    end

    def add_class
        loop do
          @io.puts "Please enter the classes you want to add, when done type \"done\""
          new_class = @io.gets.chomp

          if new_class == "done"
            @io.puts "Your classes have been added."
            break
          end
    
          while !@class_list.include?(new_class)
            @io.puts "That's not one of your classes. Please enter a valid class: "
            new_class = @io.gets.chomp
          end
          
          @io.puts "Please enter the date of the class in format DD-MM-YYYY"
          class_date_str = @io.gets.chomp
          
          begin
            class_date = Date.parse(class_date_str)
          rescue ArgumentError
            @io.puts "Invalid date format. Please enter a date in the format DD-MM-YYYY"
            class_date_str = @io.gets.chomp
            retry
          end
    
          if class_date < Date.today
            @io.puts "This date is in the past, please enter a date in the future"
            class_date_str = @io.gets.chomp
            begin
              class_date = Date.parse(class_date_str)
            rescue ArgumentError
              @io.puts "Invalid date format. Please enter a date in the format DD-MM-YYYY"
              class_date_str = @io.gets.chomp
              retry
            end
          end      
    
          added_class = { class_name: new_class, class_date: class_date_str }
          @classes << added_class
        end
    end

    def delete_class
        # returns nothing
        # remotes class from the @classes hash array
    end

    def format_class_display
        format = @classes.map { |added_class| "#{added_class[:class_name]}, #{added_class[:class_date]}" }
        format.join(",\n")
    end
end
     
