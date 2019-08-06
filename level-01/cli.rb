# Please use require_relative for requiring any dependencies
require_relative './application'
# The Main application that will be running your code
def main_display
  puts "Please choose the action you would like to perform?" \
  "\n1. Enroll into a department" \
  "\n2. Change your department" \
  "\n3. Change your section" \
  "\n4. View details" \
  "\n5. Exit"
end

def common_question_1
  puts 'What is your name?'
end

def common_question_2
  puts "Please select your department from the given choices?" \
  "\nEEE" \
  "\nMECH" \
  "\nCSE" \
  "\nCIVIL"
end

def section_question_3
  puts "Please select your section from the given choices?" \
  "\nA" \
  "\nB" \
  "\nC" \
end

def common_question_3
  puts "Please select your new interested department from the given choices?" \
  "\nEEE" \
  "\nMECH" \
  "\nCSE" \
  "\nCIVIL"
end

def details_view_options
  puts "Please choose the details you would like to get?" \
  "\n1. List all students in a department" \
  "\n2. List all students in a section" \
  "\n3. List details of a student"
end

application = Application.new

loop do
  main_display
  user_option = gets.chomp.to_i
  case user_option
    when 1
      common_question_1
      student_name = gets.chomp
      common_question_2
      student_dept = gets.chomp
      if student_dept!="MECH" && student_dept!="CSE" && student_dept!="CIVIL" && student_dept!="EEE"
        puts "\n\n>>>Please enter only the department which is in the list<<<\n\n"
      else
        application.enroll(student_name, student_dept)
      end
    when 2
      common_question_1
      student_name = gets.chomp
      common_question_3
      student_dept = gets.chomp
      if student_dept!="MECH" && student_dept!="CSE" && student_dept!="CIVIL" && student_dept!="EEE"
        puts "\n\n>>>Please enter only the department which is in the list<<<\n\n"
      else
        puts application.change_dept student_name, student_dept
      end
    when 3
      common_question_1
      student_name = gets.chomp
      section_question_3
      section = gets.chomp
      if section!='A' && section!='B' && section!='C'
        puts "There no #{section} section..Please enter valid section..!"
      else
        puts application.change_section student_name, section
      end
    when 4
      details_view_options
      selected_view = gets.chomp.to_i
      if selected_view!=1 && selected_view!=2 && selected_view!=3
        puts "\n\n>>>Please enter a valid choice of operation<<<"
      else
        case selected_view
        when 1
          common_question_2
          student_dept = gets.chomp
          if student_dept!="MECH" && student_dept!="CSE" && student_dept!="CIVIL" && student_dept!="EEE"
            puts "\n\n>>>Please enter only the department which is in the list<<<\n\n"
          else
            puts application.department_view student_dept
          end
        when 2
          common_question_2
          student_dept = gets.chomp
          if student_dept!="MECH" && student_dept!="CSE" && student_dept!="CIVIL" && student_dept!="EEE"
            puts "\n\n>>>Please enter only the department which is in the list<<<\n\n"
          else
            section_question_3
            section = gets.chomp
             if section!='A' && section!='B' && section!='C'
                puts "There no #{section} section..Please enter valid section..!"
              else
                puts application.section_view student_dept, section
              end
          end
        when 3
          common_question_1
          student_name = gets.chomp
          puts application.student_details student_name
        end
      end
    when 5
      break;
  end
  puts "\n"
  puts '...Press any key to go back...'
  gets
end