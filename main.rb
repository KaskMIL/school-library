require './app'
require './student'
require './teacher'
require './book'
require './rental'

class Main
  include App

  def initialize
    @people_list = []
    @books_list = []
    @rental_list = []
  end

  def main
    puts 'Please choose an option:'
    puts '[1] List of all Books'
    puts '[2] List of all People'
    puts '[3] Create a Person'
    puts '[4] Create a Book'
    puts '[5] Create a Rental'
    puts '[6] List of all Rentals by Person\'s name'
    puts '[7] Exit'
    user_choice = gets.chomp
    show_list(user_choice)
  end

  def show_list(user_choice)
    case user_choice
    when '1'
      list_of_books(@books_list)
      main
    when '2'
      list_of_people(@people_list)
      main
    when '7'
      puts 'Good bye'
    else
      add_to_list(user_choice)
    end
  end

  def add_to_list(user_choice)
    case user_choice
    when '3'
      add_person
      main
    when '4'
      add_book
      main
    when '5'
      add_rental
      main
    end
  end

  def add_person
    puts 'Do you want to create a Student [1] or a Teacher [2]'
    person_choice = gets.chomp
    case person_choice
    when '1'
      add_student
    when '2'
      add_teacher
    end
  end

  def add_student
    puts 'In order to create a new student, we need some information first...'
    puts 'Age?'
    stud_age = gets.chomp
    puts 'name?'
    stud_name = gets.chomp
    puts 'Has parent permission? [y/n] (Lowercase)'
    stud_permission = gets.chomp
    case stud_permission
    when 'y'
      add_person_list(@people_list, Student.new('none', stud_age, stud_name))
      puts '------------------------------'
      puts ' The Student was created successfully!'
      puts '------------------------------'
    when 'n'
      add_person_list(@people_list, Student.new('none', stud_age, stud_name, parent_permission: true))
    end
  end

  def add_teacher
    puts 'In order to create a new Teacher, we need some information first...'
    puts 'Name?'
    teach_name = gets.chomp
    puts 'Age?'
    teach_age = gets.chomp
    puts 'Specialization?'
    teach_spec = gets.chomp
    add_person_list(@people_list, Teacher.new(teach_spec, teach_age, teach_name))
    puts '---------------------------------------------'
    puts 'The Teacher was created successfully!'
    puts '---------------------------------------------'
    main
  end

  def add_book
    puts 'In order to create a new Book we need some information first...'
    puts 'What is the title of the Book?'
    book_title = gets.chomp
    puts 'Who is the Author?'
    book_author = gets.chomp
    add_book_list(@books_list, Book.new(book_title, book_author))
    puts '---------------------------------------------'
    puts 'The Book was created successfully!'
    puts '---------------------------------------------'
    main
  end

  def add_rental
    if @books_list.empty?
      puts '---------------------------------------------'
      puts 'The list of Books is empty!'
      puts '---------------------------------------------'
    elsif @people_list.empty?
      puts '---------------------------------------------'
      puts 'The list of People is empty!'
      puts '---------------------------------------------'
    else
      select_book
      book_idx = gets.chomp.to_i
      select_person
      person_idx = gets.chomp.to_i
      puts 'Date? (format yyyy-mm-dd)'
      date = gets.chomp
      add_rental_list(@rental_list, Rental.new(date, @books_list[book_idx], @people_list[person_idx]))
      puts 'The Rental was created successfully!'
    end
  end

  def select_book
    puts 'In order to create a New Rental, we need some information first...'
    puts 'Select a Book:'
    @books_list.each_with_index do |book, i|
      puts '---------------------------------------------'
      puts "[#{i}] #{book.title} - #{book.author}"
      puts '---------------------------------------------'
    end
  end

  def select_person
    puts 'Select a Person:'
    @people_list.each_with_index do |person, i|
      puts '---------------------------------------------'
      puts "[#{i}] #{person.name} - #{person.id}"
      puts '---------------------------------------------'
    end
  end
end

main = Main.new

main.main
