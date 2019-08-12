require "pry"

class Cult

    attr_reader :founding_year
    attr_accessor :name, :location, :slogan, :minimum_age

    @@all = []
    @@most_common_location = []

    def initialize(attributes)
        @name = attributes[:name]
        @location = attributes[:location]
        @founding_year = attributes[:founding_year]
        @slogan = attributes[:slogan]
        @minimum_age = attributes[:minimum_age] || 18
        @@all << self
    end

    # takes in an argument of a Follower instance and adds them to this cult's list of followers
    def recruit_follower(follower, initiation)
        if follower.age >= self.minimum_age
            BloodOath.new({cult: self, follower: follower, initiation: initiation})
        else
            puts "Sorry, this person is too young to recruit."
        end
    end

    # returns a Fixnum that is the number of followers in this cult
    def cult_population
        BloodOath.all.select{|blood_oath| blood_oath.cult == self}.count
    end

    # returns an Array of all the cults
    def self.all
        @@all
    end

    # takes a String argument that is a name and returns a Cult instance whose name matches that argument
    def self.find_by_name(name)
        self.all.select{|cult| cult.name == name}
    end

    # takes a String argument that is a location and returns an Array of cults that are in that location
    def self.find_by_location(location)
        @@all.select do |cults|
            cults.location == location
        end
    end

    # takes a Fixnum argument that is a year and returns all of the cults founded in that year
    def self.find_by_founding_year(founding_year)
        self.all.select{|cults| cults.founding_year == founding_year}
    end

    # returns an array of all followers of this cult instance
    def my_followers
        my_blood_oaths = BloodOath.all.select do |blood_oath|
            blood_oath.cult == self
        end
        my_blood_oaths.map do |blood_oath|
            blood_oath.follower
        end
    end

    # returns a Float that is the average age of this cult's followers
    def average_age
        followers_age = self.my_followers.map do |follower|
            follower.age
        end
        (followers_age.reduce(:+)/followers_age.length).to_f
    end

    # prints out all of the mottos for this cult's followers
    def my_followers_mottos
        self.my_followers.map do |follower|
            follower.life_motto
        end
    end

    # returns the Cult instance who has the least number of followers :(
    def self.least_popular
        self.all.min{ |a, b| a.my_followers.length <=> b.my_followers.length }
    end

    # returns a String that is the location with the most cults
    def self.most_common_location
        most_common_location = {}
        current_max = 0
        self.all.each do |cult|
            most_common_location[cult.location] ||= 0
            most_common_location[cult.location] += 1
        end
        most_common_location.each do |location, count|
            if count > current_max
                current_max = count
            end
        end
        most_common_location.each do |location, count|
            if count == current_max
                @@most_common_location << location
            end
        end
        @@most_common_location
    end


end