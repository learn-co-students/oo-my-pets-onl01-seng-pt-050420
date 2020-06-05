class Owner
  attr_accessor :mood
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.count
  end
  
  def self.reset_all
    @@all.clear  
  end
  
  def cats 
    Cat.all.select { |cat| cat.owner == self }
  end
  
  def dogs 
    Dog.all.select { |dog| dog.owner == self }
  end
  
  def buy_cat(meow) 
    Cat.new(meow, self)
  end
  
  def buy_dog(woof)
    Dog.new(woof, self)
  end
  
  def feed_cats  
    Cat.all.collect { |cat| cat.mood = "happy" }
  end
  
  def walk_dogs 
    Dog.all.collect { |dog| dog.mood = "happy" }
  end
  
  def sell_pets 
    Dog.all.each { |pet| pet.mood = "nervous" } && Cat.all.each { |pet| pet.mood = "nervous" } 
    Dog.all.each { |pet| pet.owner = nil } && Cat.all.each { |pet| pet.owner = nil }
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end