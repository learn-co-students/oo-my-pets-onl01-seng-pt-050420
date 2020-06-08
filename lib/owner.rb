class Owner
  @@all = []
  attr_accessor:cats,:dogs
  attr_reader:name, :species
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @cats = []
    @dogs = []
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def buy_cat(name)
     new_cat = Cat.new(name,self)
  end
  
  def buy_dog(name)
    new_dog = Dog.new(name,self)
  end
  
  def walk_dogs
     @dogs.each do |dog|
      dog.mood =  "happy" 
    end
  end
  
  
  def feed_cats
     @cats.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets
    @dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end 
    @cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    @cats.clear
    @dogs.clear
  end
  
  def list_pets
    "I have #{@dogs.count} dog(s), and #{@cats.count} cat(s)."
  end
  
  
  def self.all 
    @@all 
  end
  
  def self.count
    @@all.size
  end
  def self.reset_all
    @@all.clear
  end
end