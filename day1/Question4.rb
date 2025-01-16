#4. Regex for mobile number, email address, name, gender(M / F) and  amount


def validate_phone(phoneNumber)
    if phoneNumber.match(/^\d{10}$/)
      puts "Valid PhoneNumber #{phoneNumber}"
    else 
      puts "Invalid phone number"
    end
end


def validate_email(email)
  if email.match(/^[a-zA-Z0-9.%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)
      puts "valid email #{email}"
  else 
      puts "Invalid email"
  end
end


def validate_name(name)
  if name.match(/^[a-zA-Z0-9\s]{2,50}$/)
    puts "VAlid Name :#{name}"
  
  else 
    puts "Invalid Name : #{name}"
  end
end

def validate_gender(gender)
  if gender.match(/^(Male|male|Female|female|other)$/i)
    puts "Validate Gender : #{gender}"
  else 
    puts "Invalid Gender : #{gender}"
  end
end

def validate_amount(amount)
  if amount.match(/^\d+(\.\d{1,2})?$/)
    puts "Valid Amount : #{amount}"

  else 
      puts "Invalid Amount : #{amount}"
  end
end

puts "Enter Phone Number :"
phoneNumber = gets.chomp
validate_phone(phoneNumber)

puts "Enter Email Address :"
email = gets.chomp
validate_email(email)

puts "Enter Name:"
name = gets.chomp
validate_name(name)

puts "Enter Gender (Male/Female/Other):"
gender = gets.chomp
validate_gender(gender)

puts "Enter Amount:"
amount = gets.chomp
validate_amount(amount)
