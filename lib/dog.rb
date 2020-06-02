class Dog
  @@all = []
  attr_accessor  :owner, :mood
  attr_reader :name
  attr_writer 

  def self.all
    @@all
  end

  def initialize(name,owner)
    @name = name
    @owner = owner
    @mood = "nervous"
    @@all << self
  end
  

end