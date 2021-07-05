
class Dog
  @@all = []
  attr_accessor :mood ,:owner
  attr_reader :name
  
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