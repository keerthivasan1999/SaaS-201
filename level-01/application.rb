require_relative './department'
class Application
  attr_accessor :departments
  def initialize
    self.departments=[]
    ['EEE','MECH','CSE','CIVIL'].each do |dept|
    self.departments<<Department.new(dept)
    end
  end

  def enroll(student_name, student_department)
    department=self.departments.detect{|dept| dept.get_depart==student_department}
    sect=department.get_section
    if(sect!=0)
      section=sect[0]
      roll=department.get_depart+sect;
      department.add_details(student_name,roll)
      puts "You have been enrolled to #{department.get_depart} department.\nYou have been alloted section #{section}.\nYour roll number is #{roll}."
    else
    puts "No seat is available in the department #{department.get_depart}"
    end
  end
  def student_details(name)
    i=0
    self.departments.each do |dept|
      roll=dept.find_section(name);
      if roll!=nil
        puts "Your name is #{name}\nYour are from #{dept.get_depart} department\nYour section is #{roll[-3]}\nYour roll number is #{roll}\n"
        i=i+1
        break;
      end
    end
    if i==0
      puts "\n\n>>>>There is no student in any department with #{name} as his/her name.<<<<\n"
    end
  end
  def change_dept(student_name, student_department)
    old_depart = nil
    self.departments.each do |dept|
      roll=dept.find_section(student_name);
      if roll!=nil
        puts "you are currently in #{roll[-3]} section of #{dept.get_depart} department"
        old_depart=dept;
      end
    end
    old_depart.remove_roll(student_name)
    new_department=self.departments.detect {|dept| dept.get_depart==student_department}
    section=new_department.get_section
    if section==0
      puts "No seat available in #{new_department.get_depart} department..!"
    else
      new_roll=new_department.get_depart+section
      new_department.add_details(student_name,new_roll)
      puts "You have been changed from #{old_depart.get_depart} to #{new_department.get_depart} department"\
      "\nYour new roll number #{new_roll}."\
      "\nYour new section in #{new_department.get_depart} department is #{section[-3]}."
    end
  end 

  def change_section(student_name, section)
    old_depart=nil
    old_roll=nil
    old_section=nil
    t=0
    self.departments.each do |dept|
      roll=dept.find_section(student_name);
      if roll!=nil
        puts "you are currently in #{roll[-3]} section of #{dept.get_depart} department"
        old_depart=dept;
        old_roll=roll;
        old_section=roll[-3]
      else
        puts "\n#{student_name} is not enrolled in any department till now..!"
        t=1;
      end
    end
    if t!=1
        section_count=old_depart.find_seat(section)
        if section_count==0
          puts "No seat is available in #{section} section..!"
        else
          old_depart.remove_roll(student_name)
          new_roll=old_depart.add_roll_newsection(student_name,section)
          old_depart.add_details(student_name,new_roll)
          puts "You have been changed from #{old_section} to #{section} section."\
          "\nYour new roll number is #{new_roll}."
        end
    end
  end

  def section_view(student_department,section)
    department=self.departments.detect {|dept| dept.get_depart==student_department}
    department.show_students_specific_section(section)
  end
  
  def department_view(student_dept)
    department=self.departments.detect {|dept| dept.get_depart==student_dept}
    department.put_department_detail
  end
end