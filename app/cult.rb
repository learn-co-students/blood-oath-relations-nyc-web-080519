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
      #binding.pry
    end
    followers
  end

  #not working
  def cult_population
    # total_followers = 0
    # Bloodoath.all.each do |oath|
    #   total_followers += 1 if oath.cult == self
    #   #binding.pry
    # end
    # total_followers = 0
    self.get_followers.length
  end


# Cult#cult_population
# returns a Fixnum that is the number of followers in this cult
# Cult.all
# returns an Array of all the cults
# Cult.find_by_name
# takes a String argument that is a name and returns a Cult instance whose name matches that argument
# Cult.find_by_location
# takes a String argument that is a location and returns an Array of cults that are in that location
# Cult.find_by_founding_year
# takes a Fixnum argument that is a year and returns all of the cults founded in that year





end #end of Cult class