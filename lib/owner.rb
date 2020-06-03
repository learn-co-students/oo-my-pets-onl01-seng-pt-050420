class Owner
  attr_accessor :cat, :dog
  attr_reader :name,:species
  attr_writer
  @@all = []
  @@count = 0
 def initialize(name)
  @species = "human"
  @name = name
  @@all<<self
end

def say_species
"I am a #{@species}."
end

def self.all
@@all 
end

def self.count
  @@all.length
end

def self.reset_all
self.all.clear
end

def cats 
  Cat.all.select {|cat| cat.owner == self }
end

def dogs
Dog.all.select {|dog| dog.owner == self}
end

def buy_cat(name)
  Cat.new(name, self)
end

def buy_dog(name)
Dog.new(name, self)
end

def walk_dogs
  Dog.all.each {|dog| dog.mood = "happy"}
end

def feed_cats
  Cat.all.each {|cat| cat.mood ="happy"}
end

def sell_pets
dogs.each do |dog|
  dog.owner = nil
  dog.mood = "nervous"
end
cats.each do |cat|
  cat.owner = nil 
  cat.mood= "nervous"
end
end

def list_pets
  "I have #{dogs.length} dog(s), and #{cats.length} cat(s)."
end

end