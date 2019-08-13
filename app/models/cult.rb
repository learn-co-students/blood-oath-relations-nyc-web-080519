class Cult

    attr_accessor :name, :location, :founding_year, :slogan, :followers 

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name 
        @location = location
        @founding_year = founding_year
        @slogan = slogan 
        @followers = []
        @@all << self 
    end 

    def self.all
        @@all
    end
    
    def recruit_follower(initiation_date, follower)
        BloodOath.new(initiation_date, follower, self) 
    end

    def cult_population 
        self.followers.length
    end 

    def self.find_by_name(cult_name) 
        @@all.find do |cult|
            cult.name == cult_name 
        end 
    end 

    def self.find_by_location(cult_location)
        @@all.select do |cult|
            cult.location == cult_location 
        end 
    end 

    def self.find_by_founding_year(year)
        @@all.select do |cult|
            cult.founding_year == year 
        end 
    end 

    def average_age
        sum_of_all_ages = 0.0
        count = BloodOath.all.select do |bloodoath|
            bloodoath.cult == self
            sum_of_all_ages += bloodoath.follower.age
        end
        sum_of_all_ages/count.length
    end

    def followers_mottos
        BloodOath.all.each do |bloodoath|
            if bloodoath.cult == self 
                puts bloodoath.follower.life_motto
            end 
        end 
    end 
    
    def self.least_popular 
        tracker_hash = {}
        BloodOath.all.each do |bloodoath|
            tracker_hash[bloodoath.cult] = bloodoath.cult.cult_population
        end 
        tracker_hash.min_by {|cult_name, pop| pop}
    end 

    def self.most_common_location
        tracker_array = self.all.map {|cult| cult.location}
        tracker_hash = Hash.new(0)

        tracker_array.each do |location| 
            tracker_hash[location] += 1 
        end
        tracker_hash.max_by {|k, v| v}[0]
    end

end 