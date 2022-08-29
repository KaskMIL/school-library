require './app'
require './rental'
require './person_options'
require './book_option'

class Main
  include App
  include PersonOptions
  include BookOption

  def initialize
    @people_list = []
    @books_list = []
    @rental_list = []
  end

  def main
    puts 'Please choose an option by entering a number:'
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
    when '3'
      add_person(@people_list)
      main
    when '4'
      add_book(@books_list)
      main
    when '7'
      puts '---------------------------------------------'
      puts 'Good bye!'
      puts '---------------------------------------------'
    else
      add_to_list(user_choice)
    end
  end

  def add_to_list(user_choice)
    case user_choice
    when '5'
      add_rental
      main
    when '6'
      filter_rental
      main
    end
  end

  def add_rental
    if @books_list.empty? || @people_list.empty?
      puts '---------------------------------------------'
      puts 'The list of Book/People\'s is empty!'
      puts '---------------------------------------------'
    else
      select_book
      book_idx = gets.chomp.to_i
      select_person
      person_idx = gets.chomp.to_i
      puts 'Date? (format yyyy-mm-dd)'
      date = gets.chomp
      add_rental_list(@rental_list, Rental.new(date, @books_list[book_idx], @people_list[person_idx]))
    end
  end

  def select_book
    puts 'In order to create a New Rental, we need some information first...'
    puts 'Select a Book:'
    @books_list.each_with_index do |book, i|
      puts "[#{i}] #{book.title} - #{book.author}"
      puts '---------------------------------------------'
    end
  end

  def select_person
    puts 'Select a Person:'
    @people_list.each_with_index do |person, i|
      puts "[#{i}] #{person.name} - #{person.id}"
      puts '---------------------------------------------'
    end
  end

  def filter_rental
    if @rental_list.empty? || @people_list.empty?
      puts 'List of Rentals:'
      puts '---------------------------------------------'
      puts 'Nothing to show'
      puts '---------------------------------------------'
    else
      puts 'Choose Person entering his ID:'
      @people_list.each_with_index { |person, index| puts "[#{index}] #{person.name} - ID: #{person.id}" }
      person_id = gets.chomp.to_i
      puts 'List of Rentals:'
      filter_by_id(@rental_list, person_id)
    end
  end

  def welcome
    puts
    puts '---------------------------------------------'
    puts 'Welcome to School Library App!'
    puts '---------------------------------------------'
    puts
  end
end

main = Main.new

main.welcome
main.main
