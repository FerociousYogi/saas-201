# Expected Output:
# My Todo-list

# Overdue
# 24. [X] Submit assignment 2020-02-03

# Due Today
# 25. [X] Pay rent
# 28. [ ] Service vehicle

# Due Later
# 26. [ ] File taxes 2020-02-05
# 27. [ ] Call Acme Corp. 2020-02-05

require "active_record"

class Todo < ActiveRecord::Base
  def self.show_list
  end

  def self.add_task
  end

  def self.mark_as_complete!
  end
end
