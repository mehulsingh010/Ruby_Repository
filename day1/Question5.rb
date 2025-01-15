#5. Write a program to find IP address class.


def Determine_IP_Class(ip_address)
    octets = ip_address.split('.').map(&:to_i)

    first_octet = octets[0]

    case first_octet
    when 1..126
        puts "The IP address belongs to Class A"
    when 128..191
        puts "The IP address belongs to Class B"
    when 192..223
        puts "The IP Address belongs to Class C"
    when 224..239
        puts "The IP Address belongs to Class C" 
    when 240..255
        puts "The IP Address belongs to Class D"
    else 
      puts "Invalid IP address"
    end
end

puts "Enter an IP Address :"
ip_address = gets.chomp
Determine_IP_Class(ip_address)
