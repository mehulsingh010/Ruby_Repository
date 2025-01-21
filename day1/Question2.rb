=begin

2. WAP for students to print their school level according to grade
e.g -
if grade is between 1-5 return elementary
if grade is between 6-8 return middle school
if grade is between 9-12 return high school
if grade is between otherwise return college

=end

puts "Enter the grade "
grade = gets.to_i

def determine_school_level(grade)
  case grade
  
  when 1..5
    return "Elementary"
  when 6..8
    return "middle School"
  when 9..12
    return "high school"
  else
    return "college"
  end
end

puts "School Level Is : #{determine_school_level(grade)}" 




