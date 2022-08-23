class Person
  attr_accessor :name, :age, :parent_permission
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @age = age
    @name = name
    @parent_permission = parent_permission
    @id = Random.rand(1..1000)
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    return true if @age >= 18

    false
  end
end
