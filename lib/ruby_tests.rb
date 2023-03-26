require 'date'

@assignments = [
  {assignment_name: "History Paper", due_date: "29/03/2023"},
  {assignment_name: "Geography Essay", due_date: "28/03/2023"},
  {assignment_name: "Math Test", due_date: "23/03/2023"},
  {assignment_name: "Art Project", due_date: "22/03/2023"}
]

def due_soon_reminder
    due_soon_assignments = @assignments.select do |assignment|
        due_date = Date.strptime(assignment[:due_date], "%d/%m/%Y")
        days_until_due = (due_date - Date.today).to_i
        days_until_due <= 2
    end

    puts "Assignments due soon:"
    due_soon_assignments.each do |assignment|
        puts "#{assignment[:assignment_name]} is due on #{assignment[:due_date]}"
    end
end

def ovedue_reminder
    # returns a reminder when the task is overdue (1 minute passed due)
    # iterate over the hashed array with past due tasks
end

p due_soon_reminder