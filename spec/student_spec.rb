require './student'

describe Student do
  before :each do
    @student = Student.new('Student', 20, 'Olaoluwa')
  end

  it 'Should not return a new Student object' do
    expect(@student.class).to eql Student
  end
end
