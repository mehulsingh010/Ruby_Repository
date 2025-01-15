#3. Print a-z in reverse order

def PrintAtoZReverse()
  
  for i in ('z'.ord).downto('a'.ord)
    puts "Reverse : #{i.chr}"
  end
end

PrintAtoZReverse()
