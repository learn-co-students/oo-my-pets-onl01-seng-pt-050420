class Owner
  attr_reader :name, :species
  attr_accessor
  
  @@all = []
  
  def initialize(name)
    @name = name
    @species = species
    @@all << self
   
  end

  def species
    @species = "human"
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
  
  def cats
    Cat.all.select {|cats| cats.owner == self}
    end
    
    def dogs
      Dog.all.select {|dogs| dogs.owner ==self}
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
    
    Dog.all.each {|dogs| 
      dogs.mood = "nervous"
      dogs.owner = nil
      
    }
    Cat.all.each {|cats| 
      cats.mood = "nervous"
      cats.owner = nil
      
    }
    end
  
  def list_pets
    dog = []
    cat = []
    
    Dog.all.each do |pets| 
      if pets.owner == self
        dog << pets
      end
    end
    
    Cat.all.each do |pets|
      if pets.owner == self
        cat << pets
      end
    end
       
       "I have #{dog.count} dog(s), and #{cat.count} cat(s)."
        
  end
  
end