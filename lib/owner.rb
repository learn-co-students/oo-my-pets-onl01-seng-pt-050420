class Owner
  # code goes here
  attr_reader :name, :species

  @@all = []

  def initialize(name, species = "human")
    @name = name
    @species = species
    @@all.push(self)
    @pets = {:cats => [], :dogs => []}
  end

  def say_species
    return "I am a #{@species}."
  end

  def self.all
    return @@all
  end

  def self.count
    counter = 0
    @@all.each do |x|
      counter += 1
    end
    return counter
  end

  def self.reset_all
    return @@all.clear
  end

  def cats
    return @pets[:cats]
  end

  def dogs
    return @pets[:dogs]
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name, self)
    @pets[:cats].push(new_cat)
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name, self)
    @pets[:dogs].push(new_dog)
  end

  def walk_dogs
    @pets.collect do |key, value|
      if key == :dogs
        value.collect! do |dog|
          dog.mood = "happy"
        end
      end
    end
  end

  def feed_cats
    @pets.collect do |key, value|
      if key == :cats
        value.each do |cat|
          cat.mood = "happy"
        end
      end
    end
  end

end