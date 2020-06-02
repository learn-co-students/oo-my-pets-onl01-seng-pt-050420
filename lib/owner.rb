class Owner
  @@all = []
  attr_accessor
  attr_reader :name, :species, :say_species
  attr_writer
  def initialize(name)
    @name = name
    @species = "human"
    @say_species = "I am a #{self.species}."
    @@all << self
  end
  def self.all
    @@all
  end
  def self.count
    @@all.length
  end
  def self.reset_all
    @@all.clear
  end
  def cats
    Cat.all.select {|cats| cats.owner == self}
  end
  def dogs
    Dog.all.select {|dogs| dogs.owner == self}
  end
  def buy_cat(new_cat)
    Cat.new(new_cat, self)
  end
  def buy_dog(new_dog)
    Dog.new(new_dog, self)
  end
  def walk_dogs
    Dog.all.each {|dogs| dogs.mood = "happy"}
  end
  def feed_cats
    Cat.all.each {|cats| cats.mood = "happy"}
  end
  def sell_pets
    Cat.all.each {|pets| pets.mood = "nervous"}
    Dog.all.each {|pets| pets.mood = "nervous"}
    Cat.all.each {|pets| pets.owner = nil}
    Dog.all.each {|pets| pets.owner = nil}
  def list_pets
    dogs= []
    cats= []

    Cat.all.each do |pet|
      if pet.owner == self
        cats << pet
      end
    end
    Dog.all.each do |pet|
      if pet.owner == self
        dogs << pet
      end
    end
      # num_dogs = Dog.all.collect {|pets| if pets.owner == self}
      # num_cats = Cat.all.collect {|pets| if pets.owner == self}
      "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    end
  end
end