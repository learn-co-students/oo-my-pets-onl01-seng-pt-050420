class Cat
  # code goes here
  attr_accessor :owner, :mood
  attr_reader :name
  
  @@all = []
  
  def initialize(name, owner)
    @name = name
    @owner = owner
    owner = Owner
    @mood = "nervous"
    @@all << self
  end

  def Cat.all
    @@all
  end
  
  def cats
@@all
end
  

  
end