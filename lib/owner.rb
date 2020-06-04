class Owner
  attr_reader :name, :species

  @@all = []
  @@count = 0
  
  

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

  def cats
    Cat.all.select {|cat| cat.owner == self }
  end

 

  def dogs
    Dog.all.select {|cat| cat.owner == self }
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
      Dog.all.select {|dog| dog.mood = "happy"}
    end

    def feed_cats
      Cat.all.select {|cat| cat.mood = "happy"}
    end

    def sell_pets
      Dog.all.select {|dog| dog.mood = "nervous"}
      Cat.all.select {|cat| cat.mood = "nervous"}
      Dog.all.select {|dog| dog.owner = nil}
      Cat.all.select {|cat| cat.owner = nil}
    end
    
    def list_pets
     "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
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

end