# Arrays

puts "Problem 1:"
names = [["Jhumpa", "Lahiri"], ["J. K", "Rowling"], ["Devdutt", "Pattanaik"]]
new_names = names.map { |v| v.join(" ") }
puts new_names

puts "\n"

puts "Problem 2:"
books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
books.map.with_index { |book, i| puts "#{book} was written by #{authors[i]}" }

puts "\n"

puts "Problem 3:"
todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]
# to solve

puts "\n"

# Hashes
puts "Problem 1:"
books = ["Design as Art", "Anathem", "Shogun"]
authors = ["Bruno Munari", "Neal Stephenson", "James Clavell"]
library = {}
authors.map.with_index { |author, i| library[author.split(" ")[0].downcase.to_sym] = books[i] }
puts library

puts "\n"

puts "Problem 2:"
todos = [
  ["Send invoice", "money"],
  ["Clean room", "organize"],
  ["Pay rent", "money"],
  ["Arrange books", "organize"],
  ["Pay taxes", "money"],
  ["Buy groceries", "food"],
]
todo = {}
todos.each do |v|
  if todo.key?(v[1].to_sym)
    todo[v[1].to_sym].append(v[0])
  else
    todo[v[1].to_sym] = [v[0]]
  end
end
puts todo

puts "\n"

# Functions
puts "Problem 1:"

def salute(name, salutation)
  return "#{salutation.capitalize} Mr. #{name.split(" ")[-1]}"
end

puts salute("Nelson Rolihlahla Mandela", "hello")
puts salute("Sir Alan Turing", "welcome")

puts "\n"
