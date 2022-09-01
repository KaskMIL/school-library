require './book'
require './person'
require './student'
require './teacher'
require './classroom'
require './rental'

describe Book do
  context 'When testing the Book class' do
    it 'Should show the Title of the book' do
      book = Book.new('Foundation', 'Isaac Asimov')
      expect(book.title).to eq 'Foundation'
    end
    it 'Should show the Author of the book' do
      book = Book.new('Foundation', 'Isaac Asimov')
      expect(book.author).to eq 'Isaac Asimov'
    end
  end
end

describe Person do
  context 'When testing the Person class' do
    it 'Should show the person name' do
      person = Person.new(13, 'Tom')
      expect(person.name).to eq 'Tom'
    end
    it 'Should show person age' do
      person = Person.new(13, 'Tom')
      expect(person.age).to eq 13
    end
    it 'Should show true if the person can use the services' do
      person = Person.new(13, 'Tom')
      expect(person.can_use_services?).to eq true
    end
    it 'Should show false if the person can use the services' do
      person = Person.new(13, 'Tom', parent_permission: false)
      expect(person.can_use_services?).to eq false
    end
  end
end
