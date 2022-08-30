require './app'

module RentalList
  include App

  def show_rental(rental_list, people_list)
    if rental_list.empty? || people_list.empty?
      puts 'List of Rentals:'
      puts '---------------------------------------------'
      puts 'Nothing to show'
      puts '---------------------------------------------'
    else
      puts 'Choose Person entering his ID:'
      people_list.each_with_index { |person, index| puts "[#{index}] #{person.name} - ID: #{person.id}" }
      person_id = gets.chomp.to_i
      puts 'List of Rentals:'
      filter_by_id(rental_list, person_id)
    end
  end
end
