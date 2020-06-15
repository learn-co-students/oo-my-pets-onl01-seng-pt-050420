class Owner
  attr_accessor :mood
  attr_reader :name, :species
  @@all = []
  
  def initialize(name)
    
    @name = name
    @species = "human"
    @cats = []
    @dogs = []
    @pets = []
    save
    
  end
  
  def say_species
    
    "I am a #{species}."
    
  end
  
  def save
    
    @@all << self
    
  end
  
  def self.all
    
    @@all
    
  end
  
  def self.count
    
    self.all.count
    
  end
  
  def self.reset_all
    
    self.all.clear
    
  end
  
  
  def cats
    
    Cat.all.select {|cat| cat.owner == self}
    
  end
  
  def dogs
    
    Dog.all.select {|dog| dog.owner == self}
    
  end
  
  def buy_cat(cat)
    
    @cats << Cat.new(cat, self)
    
  end
  
  def buy_dog(dog)
    
    @dogs << Dog.new(dog, self)
    
  end
  
  def walk_dogs
    
    Dog.all.each {|dog| dog.mood = "happy"}
    
  end
  
  def feed_cats
    
    Cat.all.each {|cat| cat.mood = "happy"}
    
  end
  
  def sell_pets
    
    Cat.all.each do |cat| 
      cat.mood = "nervous"
      cat.owner = nil
    end
    Dog.all.each do |dog| 
      dog.mood = "nervous"
      dog.owner = nil
    end
    
  end
  
  def list_pets
    
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    
  end
  
end