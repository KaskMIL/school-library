require './person'
require './capitalize_Decorator'
require './trimmer_decorator'
require './classroom'
require './student'
require './book'
require './rental'

math = Classroom.new('Algebra')
stud = Student.new(math, 18, 'Tom')
book = Book.new('The Lord of the Rings', 'JRR Tolkien')
rent = Rental.new('2022-08-24', book, stud)
stud2 = Student.new('Algebra', 22, 'James')
book2 = Book.new('Foundation', 'Asimov')

puts math.students.length
math.add_student(stud)
puts math.students.length
puts stud.classroom.label
puts rent.date
puts stud.rentals[0].book.title
puts book.rentals[0].person.name
stud2.add_rental('2022-08-25', book2)
puts stud2.rentals[0].book.title
puts book2.rentals[0].date
puts book2.rentals[0].person.name
