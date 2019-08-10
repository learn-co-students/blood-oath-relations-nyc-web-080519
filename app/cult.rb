require 'pry'

class Cult

  attr_reader :name, :founding_year
  attr_accessor :location, :slogan

  @@all = []
  
  def initialize(name, location, founding_year, slogan)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(follower, initiation_date)
    Bloodoath.new(self, follower, initiation_date)
  end

  def get_followers
    followers = []
    Bloodoath.all.each do |oath|
      followers << oath.follower if oath.cult == self
    end
    followers
  end

  def cult_population
    self.get_followers.length
  end

  def self.find_by_name(name)
    self.all.find {|cult| cult.name == name }
  end

  def self.find_by_location(location)
    self.all.select {|cult| cult.location == location }
  end

  def self.find_by_founding_year(year)
    self.all.select {|cult| cult.founding_year == year }
  end


end #end of Cult class