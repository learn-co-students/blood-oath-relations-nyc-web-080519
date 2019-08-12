require "pry"
class Cult

    @@all = []

    attr_reader :name, :location, :founding_year, :slogan

    def initialize(name, location, founding_year, slogan)
        @@all << self
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
    end

    def recruit_follower(follower, date)
        if follower.age > minimum_age
            BloodOath.new(self, follower, date)
        else
            puts "Sorry, you are too young to be recruited"
        end
    end

    def my_bloodoaths
        BloodOath.all.select do |bloodoath|
            bloodoath.cult == self 
        end
    end

    def cult_population
        self.my_bloodoaths.count 

    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        self.all.find do |cult|
            cult.name == name 
        end
    end

    def self.find_by_location(location)
        self.all.select do |cult|
            cult.location == location
        end
    end

    def self.find_by_founding_year(founding_year)
        self.all.select do |cult|
            cult.founding_year == founding_year
        end
    end

    def average_age
        follower_ages = self.my_bloodoaths.sum do |bloodoath|
            bloodoath.follower.age
        end
        follower_ages.to_f / self.my_bloodoaths.count
    end

    def my_followers_mottos
        self.my_bloodoaths.each do |bloodoath|
           puts bloodoath.follower.life_motto
        end
    end

    def self.least_popular
        self.all.min do |cult1, cult2|
            cult1.cult_population <=> cult2.cult_population
        end

    end

    def self.most_common_location
        cult_locations = self.all.map do |cult|
            cult.location
        end
        
        cult_locations.max_by do |location|
            cult_locations.count(location)
        end
    end

    def minimum_age
        18
    end

end #end of Cult class





