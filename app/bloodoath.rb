require 'pry'
require 'time'

class Bloodoath

  attr_accessor :cult, :follower, :initiation_date

  @@all = []
  
  def initialize(cult, follower)
    @cult = cult
    @follower = follower
    @initiation_date = "#{Time.now.year}-#{Time.now.month}-#{Time.now.day}"
    @@all << self
  end
 


  def self.all
    @@all
  end

  def self.first_oath
    #self.all.first #returns the instance that was created first, NOT the bloodoath with the earlier date
    oaths_in_order = self.all.sort_by {|oath| Time.parse(oath.initiation_date)}
    #Time.parse will parse the initiation_date string into Time.now format and fill in the missing info (aka time) with now (must require 'time' to use this method)
    oaths_in_order.first.follower
  end
  

end #end of Bloodoath class