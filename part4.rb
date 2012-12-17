class Dessert
  attr_accessor :name, :calories

  def initialize(name, calories)
    @name = name
    @calories = calories
  end
  
  def healthy?
    self.calories < 200
  end
  
  def delicious?
    self.instance_of? Dessert
  end
end

class JellyBean < Dessert
  attr_accessor :flavor

  def initialize(name, calories, flavor)
    @name = name
    @calories = calories
    @flavor = flavor
  end
  
  def delicious?
    (self.flavor != "black licorice")
  end
end

# Test Cases

cupcake = Dessert.new "Cupcake", 250
p cupcake.name        # "Cupcake"
p cupcake.calories    # 250
p cupcake.healthy?    # false
p cupcake.delicious?  # true

puts

jelly = JellyBean.new "Jelly", 250, "black licorice"
p jelly.name          # "Jelly"
p jelly.calories      # 199
p jelly.flavor         # "chocolate"
p jelly.healthy?      # false
p jelly.delicious?    # 

puts

jellybean1 = JellyBean.new('jellybean', 5, 'strawberry')
p jellybean1.delicious?