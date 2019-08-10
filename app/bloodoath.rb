require 'pry'

class Bloodoath

  attr_reader
  attr_accessor :cult, :follower

  @@all = []
  
  def initialize(cult, follower, initiation_date)
    @cult = cult
    @follower = follower
    @initiation_date = initiation_date
    @@all << self
  end

  def self.all
    @@all
  end



end #end of Bloodoath class