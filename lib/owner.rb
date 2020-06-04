class Owner

    attr_reader :species, :name
    attr_accessor :pets

    @@all = []

    def self.all
      @@all
    end

  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
    @pets = {cats: [], dogs: []}
  end

  def say_species
    "I am a #{@species}."
  end

  def self.count
    @@all.size
  end

  def self.reset_all
    @@all.clear
  end

  def cats
    Cat.all.select { |cat| cat.owner == self}
  end

  def dogs
    Dog.all.select { |dog| dog.owner == self}
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
        Dog.all.select { |dog| dog.mood = "nervous"}
        Cat.all.select { |cat| cat.mood = "nervous"}
        Dog.all.select { |dog| dog.owner = nil}
        Cat.all.select { |dog| dog.owner = nil}
    end

    def list_pets
      "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
    end



end
