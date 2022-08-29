require './student_options'
require './teacher_options'

module PersonOptions
  include StudentOptions
  include TeacherOptions

  def add_person(person_choice, persons_list)
    case person_choice
    when '1'
      add_student(persons_list)
    when '2'
      add_teacher(persons_list)
    end
  end
end
