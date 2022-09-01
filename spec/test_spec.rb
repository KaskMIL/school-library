require './book'
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

describe Rental do
  context 'When testing Rental class' do
    before :each do
      @teacher = Teacher.new('Math', 35, 'Sam')
      @book = Book.new('Foundation', 'Isaac Asimov')
    end
    it 'create a new rental automatically assign it to the person' do
      Rental.new('2022-09-01', @book, @teacher)
      expect(@teacher.rentals[0].book.title).to eq 'Foundation'
    end
    it 'create a new rental automatically assign it to the book' do
      Rental.new('2022-09-01', @book, @teacher)
      expect(@book.rentals[0].person.name).to eq 'Sam'
    end
  end
end
