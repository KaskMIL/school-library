require './student'
require './teacher'
require './book'
require './rental'

class App
  attr_accessor :book_list, :people_list, :rental_list

  def initialize
    @book_list = []
    @people_list = []
    @rental_list = []
  end

  def create_student(classroom, age, name = 'Unknown', parent_permission: true)
    people_list.push(Student.new(classroom, age, name, parent_permission: parent_permission))
  end

  def create_teacher(specialization, age, name)
    people_list.push(Teacher.new(specialization, age, name))
  end

  def create_book(title, author)
    @book_list.push(Book.new(title, author))
  end

  def create_rental(date, book, person)
    @rental_list.push(Rental.new(date, book, person))
  end

  def get_list_by_id(id)
    rental_list.map { |rent| return rent.book.title unless rent.person.id == id }
  end
end

app = App.new

app.create_student('Math', 18, 'tom', parent_permission: false)
app.create_teacher('Math', 45, 'Seb')

app.create_book('TLOTR', 'Tolkien')
app.create_rental('2022-08-25', app.people_list[1], app.book_list[0])
app.create_book('Foundation', 'Asimov')
app.create_rental('2022-08-25', app.people_list[1], app.book_list[1])
app.create_rental('2022-08-25', app.book_list[0], app.people_list[0])

app.people_list.map { |peop| puts "name: #{peop.name}, ID: #{peop.id}"}
puts 'Select first id'
id = gets.chomp
puts app.get_list_by_id(id)

# puts app.people_list[0].name
# puts app.book_list[0].title
# puts app.rental_list[0].date
# puts app.people_list[0].rentals[0].book.author
