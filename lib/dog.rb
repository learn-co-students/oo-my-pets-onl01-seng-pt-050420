class Dog
  attr_accessor :mood, :owner 
  attr_reader  :name 
  @@all = []
  @@instances = []

  def initialize(name, owner)
    @name = name 
    @owner = owner 
    @mood = "nervous"
    @@instances << self 
  end 

  def self.all
    @@instances
  end 

end