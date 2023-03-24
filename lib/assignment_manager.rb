require "date"

class AssignmentManager
    def initialize(io)
        @io = io
        @assignments = []
    end

    def add_assignment
        loop do
            @io.puts "Please enter the assignment you want to add, when done type \"done\""
            assignment = @io.gets.chomp

          if assignment == "done"
            @io.puts "Your assignments have been added."
            break
          end

          @io.puts "Please enter the date of the assignment in format DD-MM-YYYY"
          assignment_date_str = @io.gets.chomp
          begin
            assignment_date = Date.parse(assignment_date_str)
          rescue ArgumentError
            @io.puts "Invalid date format. Please enter a date in the format DD-MM-YYYY"
            assignment_date_str = @io.gets.chomp
            retry
          end

          added_assignment = { assignment_name: assignment, assignment_date: assignment_date_str }
          @assignments << added_assignment
        end
        return format_assignment_display
    end

    def delete_assignment
        # returns nothing
        # remotes assignment from the @assignment hash array
    end

    def format_assignment_display
        format = @assignments.map { |assignment| "#{(@assignments.index(assignment))+1}. #{assignment[:assignment_name]}, #{assignment[:assignment_date]}" }
        format.join(",\n")
    end
end