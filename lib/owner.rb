require 'pry'

class Owner
  attr_reader :name, :species, :pets

  @@all = []
  @purchased_pets = []
  @pets = {
    :dogs => [],
    :cats => []
  }

  def initialize(name, species="human")
    @name = name
    @species = species
    @@all << self
    @purchased_pets = []
    @pets = {
      :dogs => [],
      :cats => []
    }
  end

  def say_species
    "I am a #{species}."
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

  def new_dog(pet)
    @pets[:dogs] << pet

  end

  def new_cat(pet)
    @pets[:cats] << pet
  end

  def cats
    @pets[:cats]
  end

  def dogs
    @pets[:dogs]
  end

  def buy_cat(name)
    name = Cat.new(name, self)
    name
  end

  def buy_dog(name)
    name = Dog.new(name, self)
    name
  end

  def walk_dogs
    @pets[:dogs].each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats
    @pets[:cats].each do |cat|
      cat.mood = "happy"
    end
  end

  def sell_pets
    @pets[:dogs].each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
    @pets[:cats].each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    @pets[:cats] = []
    @pets[:dogs] = []

  end

  def list_pets
    "I have #{@pets[:dogs].length} dog(s), and #{@pets[:cats].length} cat(s)."
  end

end
