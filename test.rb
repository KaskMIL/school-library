require './person'
require './capitalize_Decorator'
require './trimmer_decorator'
require './classroom'
require './student'

math = Classroom.new('Algebra')
stud = Student.new('math', 18, 'Tom')
puts math.students.length
math.add_student(stud)
puts math.students.length
puts stud.classroom.label
