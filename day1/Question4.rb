#4. Regex for mobile number, email address, name, gender(M / F) and  amount


def Validate_Phone(phoneNumber)
    if phoneNumber.match(/^\d{10}$/)
      puts "Valid PhoneNumber #{phoneNumber}"
    else 
      puts "Invalid phone number"
    end
end


def Validate_Email(email)
  if email.match(/^[a-zA-Z0-9.%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/)
      puts "valid email #{email}"
  else 
      puts "Invalid email"
  end
end


def Validate_Name(name)
  if name.match(/^[a-zA-Z0-9\s]{2,50}$/)
    puts "VAlid Name :#{name}"
  
  else 
    puts "Invalid Name : #{name}"
  end
end

def Validate_Gender(gender)
  if gender.match(/^(Male|male|Female|female|other)$/i)
    puts "Validate Gender : #{gender}"
  else 
    puts "Invalid Gender : #{gender}"
  end
end

def Validate_Amount(amount)
  if amount.match(/^\d+(\.\d{1,2})?$/)
    puts "Valid Amount : #{amount}"

  else 
      puts "Invalid Amount : #{amount}"
  end
end

puts "Enter Phone Number :"
phoneNumber = gets.chomp
Validate_Phone(phoneNumber)

puts "Enter Email Address :"
email = gets.chomp
Validate_Email(email)

puts "Enter Name:"
name = gets.chomp
Validate_Name(name)

puts "Enter Gender (Male/Female/Other):"
gender = gets.chomp
Validate_Gender(gender)

puts "Enter Amount:"
amount = gets.chomp
Validate_Amount(amount)
