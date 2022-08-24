require './decorator'

class TrimmerDecorator < Decorator
  def correct_name
    return @nameable.correct_name.slice(0..9) if @nameable.correct_name.length > 10
  end
end
