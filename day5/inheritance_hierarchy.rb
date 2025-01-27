class Parent
    def greet
        puts "Hello from parents"
    end
end

class Child < Parent
    def greet
        # super 
        puts "Hello from child"
    end
end

child = Child.new()
child.greet

puts Parent.ancestors
# output 
# Parent
# Object
# Kernel
# BasicObject


#Without use of super 
# Output:
# Hello from Child

# when used super
# Output:
# Hello from Parent
# Hello from Child
