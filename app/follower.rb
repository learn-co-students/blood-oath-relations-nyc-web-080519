require 'pry'

class Follower

  attr_reader :name
  attr_accessor :age, :life_motto

  @@all = []
  
  def initialize(name, age, life_motto)
    @name = name
    @age = age
    @life_motto = life_motto
    @@all << self
  end

  def self.all
    @@all
  end

  def join_cult(cult, initiation_date)
    Bloodoath.new(cult, self, initiation_date)
  end



end #end of Follower class