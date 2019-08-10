require 'pry'

class Cult

  attr_reader :name, :founding_year
  attr_accessor :location, :slogan, :minimum_age

  @@all = []
  
  def initialize(name, location, founding_year, slogan, minimum_age=18)
    @name = name
    @location = location
    @founding_year = founding_year
    @slogan = slogan
    @minimum_age = minimum_age
    @@all << self
  end

  def self.all
    @@all
  end

  def recruit_follower(follower)
    if follower.age >= self.minimum_age
      Bloodoath.new(self, follower) 
    else
      puts "I'm sorry, you must be #{self.minimum_age} or older to take the blood oath and join the #{self.name} cult."
    end
  end

  #recruit_follower
# takes in an argument of a Follower instance and adds them to this cult's list of followers
# NOW this is changed such that if the given Follower instance is not of age:
# do not let them join the cult
# print out a friendly message informing them that they are too young


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

  def average_age 
    total_age = 0
    divisor = 0
    get_followers.each do |follower|
      total_age += follower.age 
      divisor += 1
    end
    total_age / divisor.to_f
  end

  def my_followers_mottos
    get_followers.each {|follower| puts follower.life_motto}
  end
  #this puts the mottos and returns the original array; deliverables don't specifiy a return

  def self.least_popular
    self.all.min_by {|cult| cult.cult_population}
  end

  def self.get_locations
    locations = []
    self.all.each {|cult| locations << cult.location }
    locations
  end

  def self.most_common_location
    # #method 1
    # location_count = Hash.new(0) #this initializes a new hash with key values set to a default of zero
    # get_locations.each_with_object(location_count) { |location, location_count| location_count[location] += 1 } 
    # #each_with_object makes a new key of location if the location doesn't already exist in the hash, otherwise it increments the count each time the location appears
    # location_count.max_by {|location, count| count }[0]
    # #returns an array ["location", count] so return index 0 to get the location string
    # #left this here in case I wanted to make other methods that might need the count of each location

    #method 2
    get_locations.max_by { |location| get_locations.count(location)}
    #max_by will return the obj with largest count, and each location in the array is being counted with .count(location). Each element is being iterated and counted, then max_by picks out the object that has the highest count.
    #source: https://medium.com/@dallasbille/two-ways-of-finding-the-element-that-occurs-the-most-in-an-array-with-ruby-7fb484ea1a6d

  end

end #end of Cult class


