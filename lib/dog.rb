class Dog
  attr_accessor :mood, :owner
  attr_reader :name
  @@all=[]
  
  def initialize(name, owner)
    @owner = owner
    @name = name
    @mood = "nervous"
    save
  end 
  
  def self.all 
    @@all
  end 
  
  def save
    @@all << self
  end 
  
end 