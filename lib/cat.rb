class Cat
  attr_accessor :owner, :mood
  attr_reader :name

  @@all = []

  def initialize(name,owner)
    @name, @owner = name, owner
    @mood = "nervous" #returns nil if otherwise
    @@all << self
  end 

  def self.all 
    @@all
  end

end