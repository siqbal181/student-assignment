
# check if the date is in the future
require 'date'

@classes = []
@class_list = ["History", "Geography", "Maths", "English", "Spanish", "Science"]

def add_class
    loop do
      puts "Please enter the classes you want to add, when done type \"done\""
      new_class = gets.chomp
      if new_class == "done"
        puts "Your classes have been added."
        break
      end

      while !@class_list.include?(new_class)
        puts "That's not one of your classes. Please enter a valid class: "
        new_class = gets.chomp
      end

      puts "Please enter the date of the class in format DD-MM-YYYY"
      class_date_str = gets.chomp

      begin
        class_date = Date.parse(class_date_str)
      rescue ArgumentError
        puts "Invalid date format. Please enter a date in the format DD-MM-YYYY"
        class_date_str = gets.chomp
        retry
      end

      if class_date < Date.today
        puts "This date is in the past, please enter a date in the future"
        class_date_str = gets.chomp
        begin
          class_date = Date.parse(class_date_str)
        rescue ArgumentError
          puts "Invalid date format. Please enter a date in the format DD-MM-YYYY"
          class_date_str = gets.chomp
          retry
        end
      end      

      added_class = { class_name: new_class, class_date: class_date_str }
      @classes << added_class
    end
end

def format_class_display
    format = @classes.map { |added_class| "#{added_class[:class_name]}, #{added_class[:class_date]}" }
    format.join(",\n")
end

p add_class