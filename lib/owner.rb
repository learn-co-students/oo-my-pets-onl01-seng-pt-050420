class Owner

  attr_reader :name, :species 

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @cats = []
    @dogs = []
    save
  end

  def add_cat(cat)
    @cats << cat
  end

  def save
    @@all << self
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

  def say_species
    "I am a #{@species}."
  end

  def cats
    @cats
  end

  def dogs
    @dogs
  end

  def buy_cat(cat)
    Cat.new(cat, self)
  end

  def buy_dog(dog)
    Dog.new(dog, self)
  end

  def walk_dogs
    self.dogs.each {|dog| dog.mood = "happy"}
  end

  def feed_cats
    self.cats.each {|cat| cat.mood = "happy"}
  end

  def sell_pets
    self.cats.each {|cat| cat.mood = "nervous"}
    self.cats.each {|cat| cat.owner = nil}
    self.cats.clear
    self.dogs.each {|dog| dog.mood = "nervous"}
    self.dogs.each {|dog| dog.owner = nil}
    self.dogs.clear
  end

  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end

end