class ClassManager
    def initialize(io)
        @io = io
        @classes = []
    end

    def add_class
        loop do
          @io.puts "Please enter the classes you want to add, when done type \"done\""
          new_class = @io.gets.chomp
          if new_class == "done"
            @io.puts "Your classes have been added."
            break
          end
          @io.puts "Please enter the date of the class in format DD/MM/YYYY"
          class_date = @io.gets.chomp

          added_class = { class_name: new_class, class_date: class_date }
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
