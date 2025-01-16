#3. Print a-z in reverse order

def print_a_to_z_reverse()
  
  for i in ('z'.ord).downto('a'.ord)
    puts "Reverse : #{i.chr}"
  end
end

print_a_to_z_reverse()
