# super class
class Chef

  def make_chicken
    puts "The chef makes chicken"
  end

  def make_salad
    puts "The chef makes salad"
  end

  def call_private_method
    makes_special_dish
  end
  private 
#   by making the fucntion private the subclass can't access the function of super class
# to call the private method u need to call it implicitly 
  def makes_special_dish
    puts "The chef makes bbq ribs"
  end

end

# subclass
class Italian < Chef 
#   function override
  def makes_special_dish
    puts "The chef make biryani"
  end

  def make_pasta
    puts "The chef make Pasta"
  end
end

class Porto < Italian
  def initialize
    puts "The Chef is from Porto Region "
  end
  def make_salad
    puts "The Chef make Spicy Salad"
  end
end
# chef = Chef.new
# chef.make_chicken

# italian_chef = Italian.new()
# italian_chef.make_salad

chef = Chef.new()
chef.call_private_method

italian_chef = Italian.new()
italian_chef.make_chicken
italian_chef.make_pasta

porto_chef = Porto.new()

porto_chef.make_salad