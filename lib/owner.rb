require 'pry'
class Owner
     @@all = []
    #  @@owner_count = 0
     attr_accessor 
     attr_writer 
     attr_reader :name, :species

     def initialize(name)
      @name = name
      @species = "human"
      @@all << self
      # @@owner_count +=1
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

     def say_species
       "I am a #{@species}."
     end
     def cats
      Cat.all.select{|cat| cat.owner == self}
     end
     def dogs
      Dog.all.select{|dog| dog.owner == self}
      
     end

     def buy_cat(cat_name)
      cat_name = Cat.new(cat_name,self)
      
     end

     def buy_dog(dog_name)
      dog_name =Dog.new(dog_name, self)
     end

     def walk_dogs

      Dog.all.each{|dog|dog.mood = "happy"}

     end
     def feed_cats
      Cat.all.each{|cat|cat.mood = "happy"}

     end
     def sell_pets
      pets = cats + dogs
      pets.select{|pet| pet.mood = "nervous"; pet.owner = nil } 
      
     end
     def list_pets
       "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
   

     end
  
end