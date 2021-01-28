require "active_record"

class Todo < ActiveRecord::Base
  def due_today?
    due_date == Date.today
  end

  def overdue?
    due_date < Date.today
  end

  def due_later?
    due_date > Date.today
  end

  def to_displayable_string
    display_status = completed ? "[X]" : "[ ]"
    display_date = due_today? ? nil : due_date
    "#{id}. #{display_status} #{todo_text} #{display_date}"
  end

  def self.to_displayable_list(todos)
    todos.map { |todo| todo.to_displayable_string }
  end

  def self.show_list
    puts "My Todo-list\n\n"

    puts "Overdue\n"
    puts to_displayable_list(all.filter { |todo| todo.overdue? })
    puts "\n\n"

    puts "Due Today\n"
    puts to_displayable_list(all.filter { |todo| todo.due_today? })
    puts "\n\n"

    puts "Due Later\n"
    puts to_displayable_list(all.filter { |todo| todo.due_later? })
    puts "\n\n"
  end

  def self.add_task(todo)
    new_todo = create(todo_text: todo[:todo_text], due_date: Date.today + todo[:due_in_days], completed: false)
    new_todo.save
    new_todo
  end

  def self.mark_as_complete!(id)
    todo = all.find(id)
    todo.completed = true
    todo.save
    todo
  end
end
