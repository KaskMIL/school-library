require './student'
require './teacher'

stud = Student.new('math', 12, 'tom')
teach = Teacher.new('math', 32, 'sam')

puts stud.is_a?(Student)
puts teach.class