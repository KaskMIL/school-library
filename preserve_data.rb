require 'json'
require './student'
require './teacher'

module PreserveData
  def save_rental(rental_list)
    rental_list.each do |data|
      data_rental = JSON.generate(data)
      File.write('data/rentals.json', "#{data_rental}\n", mode: 'w')
    end
    puts 'List saved successfully!'
  end

  def save_persons(persons_list)
    File.open('data/persons.json', mode: 'w')
    persons_list.each do |person|
      person_data = [person.class, person.name, person.age, person.parent_permission]
      person_json = JSON.generate(person_data)
      File.write('data/persons.json', "#{person_json}\n", mode: 'a')
    end
    puts 'Person list saved succsessfully'
  end

  def save_books(books_list)
    books_list.each do |book|
      data_book = JSON.generate(book)
      File.write('data/books.json', "#{data_book}\n", mode: 'w')
    end
    puts 'Book list saved successfully'
  end

  def read_persons
    return [] unless File.exist?('data/persons.json') && !File.zero?('data/persons.json')

    persons_list = []
    File.foreach('data/persons.json') do |person_json|
      person = JSON.parse(person_json)
      case person[0]
      when 'Student'
        stud = Student.new('none', person[2].to_i, person[1], parent_permission: person[3])
        persons_list.push(stud)
      when 'Teacher'
        teach = Teacher.new('Math', person[2].to_i, person[1])
        persons_list.push(teach)
      end
    end
    persons_list
  end

  def read_books
    return [] unless File.exist?('data/books.json') && !File.zero?('data/books.json')

    books_list = []
    File.foreach('data/books.json') { |book| books_list.push(JSON.parse(book)) }
    books_list
  end

  def read_rental
    return [] unless File.exist?('data/rentals.json') && !File.zero?('data/rentals.json')

    rental_list = []
    File.foreach('data/rentals.json') { |rental| rental_list.push(JSON.parse(rental)) }
    rental_list
  end
end
