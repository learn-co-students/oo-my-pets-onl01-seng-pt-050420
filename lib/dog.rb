class Dog
  attr_accessor :mood, :owner, :mood
  attr_reader :name
  attr_writer
  @@dogs = []
  def initialize(name, owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@dogs << self
  end
  
  def self.all
    @@dogs
  end
end