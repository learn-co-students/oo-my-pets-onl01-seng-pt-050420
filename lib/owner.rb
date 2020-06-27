class Owner
  
  attr_accessor :pets
  attr_reader :species, :name
  @@owner = []

  def initialize(name)
    @name = name
    @species = "human"
    save
    @dog = []
    @cat = []
  end

  def say_species
    return "I am a #{@species}."
  end
  
  def save 
    @@owner << self
  end 

   def self.all
    @@owner
  end

  def self.reset_all
    @@owner.clear
  end

  def self.count
    @@owner.size
  end
  
  
   def cats	
        Cat.all.select do |cat|	
            cat.owner == self	
        end	
    end
  
  
   def dogs	
        Dog.all.select do |dog|	
            dog.owner == self	
        end	
    end
  
  def buy_cat(name)
    @cat << Cat.new(name, self)
  end

  def buy_dog(name)
    @dog << Dog.new(name, self)
  end

   def walk_dogs
   self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    self.cats.each do |cat|
      self.cats.delete(cat)
      cat.owner = nil
      cat.mood = "nervous"
    end 
    self.dogs.each do |dog|
      self.dogs.delete(dog)
      dog.owner = nil
      dog.mood = "nervous"
    end 
  end 

  def list_pets
    "I have #{@dog.count} dog(s), and #{@cat.count} cat(s)."
  end
  
  
end