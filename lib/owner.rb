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
      @@all = []
    end

    def cats
    Cat.all.select do |cat|
        cat.owner == self 
        
       end 
    end

    def dogs
      Dog.all.select do |dog|
          dog.owner == self 
          
         end 
      end
  
    def buy_cat(cat_name)
      Cat.new(cat_name, self)
    end

    def buy_dog(dog_name)
      Dog.new(dog_name, self)
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
     Cat.all.each {|pet| pet.mood = "nervous"}
     Dog.all.each {|pet| pet.mood = "nervous"}
     Cat.all.each {|pet| pet.owner = nil}
     Dog.all.each {|pet| pet.owner = nil}
      
 

    
    end
  
    def list_pets
    dogs= []
    cats = []

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
      "I have #{dogs.count} dog(s), and #{cats.count} cat(s)."
    end
end  