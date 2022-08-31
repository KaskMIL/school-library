require 'json'

module PreserveData
  def save_rental(rental_list)
    rental_list.each do |data|
      data_json = JSON.generate(data)
      File.write('data/rentals.json', "#{data_json}\n", mode: 'a')
    end
    puts 'List saved successfully!'
  end

  def save_persons(persons_list)
    persons_list.each do |person|
      data_person = JSON.generate(person)
      File.write('data/persons.json', "#{data_person}\n", mode: 'a')
    end
    puts 'Person list saved succsessfully'
  end

  def save_books(books_list)
    books_list.each do |book|
      data_book = JSON.generate(book)
      File.write('data/books.json', "#{data_book}\n", mode: 'a')
    end
    puts 'Book list saved successfully'
  end

  def read_persons(persons_lis)
    return puts 'Nothing to show' unless File.exist?('data/persons.json') && !File.zero?('data/persons.json')

    File.foreach('data/persons.json') { |person| persons_lis.push(JSON.parse(person)) }
  end

  def read_books(books_list)
    return puts 'Nothing to show' unless File.exist?('data/books.json') && !File.zero?('data/books.json')

    File.foreach('data/books.json') { |book| books_list.push(JSON.parse(book)) }
  end

  def read_rental(rental_list)
    return puts 'nothing to show' unless File.exist?('data/rentals.json') && !File.zero?('data/rentals.json')

    File.foreach('data/rentals.json') { |rental| rental_list.push(JSON.parse(rental)) }
  end
end
