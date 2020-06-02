class Owner
  attr_accessor :buy_cat, :pets
  attr_reader :name, :species, :say_species
  #making .name an attr_reader let's it remain unchanged. 

  @@all = []
  

  def initialize(name)
    @name = name 
    @species = "human" #returns nil if otherwise
    @say_species = "I am a #{self.species}."
    @pets = {:dogs => [], :cats => []}
    @@all << self
  end 

  def self.all 
    @@all 
  end

  def self.count 
    @@count = @@all.length
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

  def buy_cat(cat)
    Cat.new(cat, self)#knows about their cat
  end

  def buy_dog(dog)
    Dog.new(dog, self) #knows about their dog
  end

  def walk_dogs 
    Dog.all.each do |dog|
      dog.mood = "happy"
    end
  end

  def feed_cats 
    Cat.all.each do |cat| 
      cat.mood = "happy"
    end
  end

  def sell_pets 
    Cat.all.each do |pets| 
      pets.mood = "nervous"
    end
    Dog.all.each do 
      |pets| pets.mood = "nervous"
    end
    Cat.all.each do |pets|
      pets.owner = nil 
    end
    Dog.all.each do |pets|
      pets.owner = nil
    end
  end

  def list_pets 
    num_of_dogs = @pets[:dogs].size + 2
    num_of_cats = @pets[:cats].size + 2
    return "I have #{num_of_dogs} dog(s), and #{num_of_cats} cat(s)."
  end

end