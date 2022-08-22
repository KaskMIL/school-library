class Person
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @age = age
    @name = name
    @parent_permission = parent_permission
  end

  # def name
  #   @name
  # end

  # def id
  #   @id
  # end

  # def age
  #   @age
  # end

  def can_use_services?
    return true if age >= 18 || @parent_permission

    false
  end

  private

  def is_of_age?
    return true if @age >= 18

    false
  end
end
