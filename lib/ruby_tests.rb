require 'date'

@assingments = [
  {assignment_name: "History Paper", due_date: 29/03/2023},
  {assignment_name: "Geography Essay", due_date: 28/03/2023},
  {assignment_name: "Math Test", due_date: 23/03/2023},
  {assignment_name: "Art Project", due_date: 22/03/2023}
]

def current_time
    d = Date.new() # used to compare the task due date with the current time
    d.strftime("%d/%m/%y")
    Date.parse(d).to_date
end

def due_soon_reminder
    @assignments
    # returns a reminder when the task is due soon (2 days before)
    # iterate over hashed array with the due soon tasks
end

def ovedue_reminder
    # returns a reminder when the task is overdue (1 minute passed due)
    # iterate over the hashed array with past due tasks
end

p current_time