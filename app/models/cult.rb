class Cult
    attr_accessor :name, :location, :founding_year, :slogan

    @@all = []
    
    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @@all << self 
    end

    def recruit_follower(follower, initiation_date)
        BloodOath.new(self, follower, initiation_date)
    end

    def my_bloodOaths
        BloodOath.all.select do |bloodOath|
            bloodOath.cult == self
        end
    end

    def average_age
        my_ages = my_bloodOaths.map do |bloodOath|
            bloodOath.follower.age
        end
        my_ages.sum.to_f / my_ages.count.to_f
    end

    def my_followers_mottos
        my_mottos = my_bloodOaths.each do |bloodOath|
            puts bloodOath.follower.life_motto
        end
        return
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
        self.all.find do |cult|
            cult.location == location
        end
    end

    def self.find_by_founding_year(founding_year)
        self.all.find do |cult|
            cult.founding_year == founding_year
        end
    end

    def self.least_popular
        least_popular = Cult.all.first
        Cult.all.each do |cult|
            if cult.my_bloodOaths.count < least_popular.my_bloodOaths.count
                least_popular = cult
            end
        end
        return least_popular
    end

    def self.most_common_location
        location_hash = {}
        Cult.all.each do |cult|
            if location_hash.keys.include?(cult.location)
                #increment
                location_hash[cult.location] += 1
            else
                #create new key/value pair
                location_hash[cult.location] = 1
            end
        end
        biggest_num = 0
        biggest_location = ""
        location_hash.each do |location, num|
            if num > biggest_num
                biggest_num = num
                biggest_location = location
            end
        end
        return biggest_location
    end
end #end of Cult class

