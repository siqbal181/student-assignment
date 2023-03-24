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
    
          added_class = { class_name: new_class, class_date: class_date_str }
          @classes << added_class
        end
    end

    def delete_classes
      loop do
        @io.puts "Type the number of the class you want to delete. Type \"done\" when complete."
        @io.puts format_class_display
        delete_class = @io.gets.chomp
        break if delete_class == "done"
        # get the index of delete class input to check for incorrect number or bigger then length
        delete_class = delete_class.to_i
        if delete_class < 1 || delete_class > @classes.length
          @io.puts "Invalid input. Please enter a number between 1 and #{@classes.length}"
          next
        end
    
        class_index = (delete_class) - 1
        deleted_class = @classes.delete_at(class_index)
          
        puts "This class has been deleted. Here is your class list: "
        puts format_class_display
      end
    end

    def format_class_display
        format = @classes.map { |added_class| "#{(@classes.index(added_class))+1}. #{added_class[:class_name]}, #{added_class[:class_date]}" }
        format.join(",\n")
    end
end
     
