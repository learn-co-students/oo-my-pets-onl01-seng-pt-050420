class Owner
  attr_accessor :pets 
  attr_reader :name, :species
  
  @@instances =[]
  

  def initialize(name)
    @name = name 
    @species = "human"
    @@instances << self
    
  end 

  def cats
    Cat.all.select {|x| x.owner == self}
  end 

  def dogs 
    Dog.all.select  {|x| x.owner == self}   
  end  

  def buy_cat(x)
    Cat.new(x, self)  
  end 

  def buy_dog(y)
    Dog.new(y, self)    
  end 

  def walk_dogs
    Dog.all.each {|x| x.mood = "happy"} 
  end 

  def feed_cats
    Cat.all.each {|x| x.mood = "happy"}
  end 

  def sell_pets
    Cat.all.each do |x| 
      x.mood = "nervous"
      x.owner = nil 
    end 
    Dog.all.each do |x| 
      x.mood = "nervous"
      x.owner = nil 
    end 
  end 

  def list_pets 
    "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
  end 

  def say_species 
    "I am a #{@species}."
  end 
 
  def self.all
    @@instances
  end

  def self.count
    @@instances.length
  end

  def self.reset_all
    @@instances.clear
  end 
   
  
end 