#1. Write a program to display number is prime or not


puts "Enter A Number To check whether it is a prime number or not"
num = gets.to_i

def is_prime?(num)
  
  if  num < 2
    puts "Number #{num} Is not a Prime Number"
    return 
  end

  for i in 2..Math.sqrt(num).to_i
    if num % i == 0
        puts "Number #{num} Is not a Prime Number"
        return 
    end 
  end 
  puts "Number #{num} Is a Prime Number"
end


is_prime?(num)
