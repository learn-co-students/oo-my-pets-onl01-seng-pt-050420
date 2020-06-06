class Owner
  attr_reader :name, :species
  @@all = []
  
  def initialize(name, species = 'human')
    @name = name
    @species = species
    save
  end
  
  def say_species
    "I am a #{@species}."
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
#   @@all = []  or @@all.clear
    @@all.clear
  end
  
  def cats 
    Cat.all.select {|cat| cat.owner == self} #self refers to the owner
  end
  
  def dogs 
    Dog.all.select {|dog| dog.owner == self} #self refers to the owner
  end
  
  def buy_cat(cat_name)
    cat_name = Cat.new(cat_name, self) #self refers to the owner
  end
  
  def buy_dog(dog_name)
    dog_name = Dog.new(dog_name, self) #self refers to the owner
  end
  
  def walk_dogs
    self.dogs.map {|dog| dog.mood = "happy"}
  end
  
  def feed_cats
    self.cats.map {|cat| cat.mood = "happy"}
  end
  
  def sell_pets
    pets = self.cats + self.dogs #combinding cats and dogs methods to get a list of pets owned by owner
    pets.map do |pet|
    pet.mood = "nervous" 
    pet.owner = nil
  end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end







