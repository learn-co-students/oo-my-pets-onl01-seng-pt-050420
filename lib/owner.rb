class Owner
  
  attr_accessor :cats, :dogs
  attr_reader :species, :name
  
  @@all = []
  
  def initialize(name)
    @species = "human"
    @cats = []
    @dogs = []
    @name = name
    @@all << self
  end

  def say_species
    "I am a #{self.species}."
  end
  
  def buy_cat(name)
    Cat.new(name, self)
  end

  def buy_dog(name)
    Dog.new(name, self)
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
    number_of_dogs = self.dogs.count
    number_of_cats = self.cats.count
    
    "I have #{number_of_dogs} dog(s), and #{number_of_cats} cat(s)."
  end

  def self.all
    @@all
  end
  
  def self.count
    self.all.length
  end

  def self.reset_all
    self.all.clear
  end  
end 


  

  