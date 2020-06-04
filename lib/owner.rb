class Owner
  attr_accessor :pets 
  attr_reader :name, :species
  
  #@@count = 0 
  @@instances =[]
  

  def initialize(name)
    @name = name 
    @species = "human"
    #@@count += 1        #what will this mess up later on in the code? 
    @@instances << self
    
  end 

  def cats      # #this is where we need to check to see
    #if the cats owner is the one who called this method
    Cat.all.select {|x| x.owner == self}
  end 

  def dogs 
    Dog.all.select  {|x| x.owner == self}   #select mean one dog
  end  

  def buy_cat(x)
    Cat.new(x, self)    #create a new cat and attach that cat to the owner
  end 

  def buy_dog(y)
    Dog.new(y, self)    
  end 

  def walk_dogs
    Dog.all.each {|x| x.mood = "happy"}    #each means all dogs
    #dogs.each {|x| x.mood = "happy"}  This would also work 
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
  # def self.all      #stackoverflow: can use ObjectSpace.each_object but not recc.why?
  #   ObjectSpace.each_object(self).to_a
  # end 

  # def self.count        #this method showed pass but it did not allow the entire Class method to pass b/c @count does not store the instances. 
  #   @@count 
  # end

  def self.count
    @@instances.length
    #self.all.length
  end

  def self.reset_all
    @@instances.clear    #@@instances is used here b/c its stores all the instances: @@instances << self 
  end 
   
  
end 

