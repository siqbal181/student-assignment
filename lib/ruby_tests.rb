@classes = [
  {:class_name=>"History", :class_date=>"24-03-2023"},
  {:class_name=>"Geography", :class_date=>"25-03-2023"},
  {:class_name=>"Science", :class_date=>"25-03-2023"}
]

def add_class
    loop do
      puts "Please enter the classes you want to add, when done type \"done\""
      new_class = gets.chomp
      if new_class == "done"
        puts "Your classes have been added."
        break
      end
      puts "Please enter the date of the class in format DD-MM-YYYY"
      class_date_str = gets.chomp
      added_class = { class_name: new_class, class_date: class_date_str }
      @classes << added_class
    end
    return format_class_display
end

def delete_classes
  loop do
    puts "Type the number of the class you want to delete. Type \"done\" when complete."
    format = @classes.map { |added_class| "#{(@classes.index(added_class))+1}. #{added_class[:class_name]}, #{added_class[:class_date]}" }
    puts format.join("\n")
    delete_class = gets.chomp
    break if delete_class == "done"
    # get the index of delete class input to check for incorrect number or bigger then length
    delete_class = delete_class.to_i
    if delete_class < 1 || delete_class > @classes.length
      puts "Invalid input. Please enter a number between 1 and #{@classes.length}"
      next
    end

    class_index = (delete_class) - 1
    deleted_class = @classes.delete_at(class_index)

    format_minus_class = @classes.map { |added_class| "#{(@classes.index(added_class))+1}. #{added_class[:class_name]}, #{added_class[:class_date]}" }
    puts "This class has been deleted. Here is your class list: "
    puts format_minus_class.join("\n")
    puts ("\n")
  end
end

def format_class_display
  format = @classes.map { |added_class| "#{(@classes.index(added_class))+1}. #{added_class[:class_name]}, #{added_class[:class_date]}" }
  format.join(",\n")
end

p add_class
p delete_classes
