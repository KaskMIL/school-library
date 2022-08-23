require './person'
require './capitalize_Decorator'
require './trimmer_decorator'

person = Person.new(22, 'maximilianus')
capitalize_person = CapitalizeDecorator.new(person)
trim_person = TrimmerDecorator.new(person)

puts person.correct_name
puts capitalize_person.correct_name
puts trim_person.correct_name
