class Cult
    attr_accessor :name, :location, :founding_year, :slogan, :followers

    @@all = []

    def initialize(name)
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

    def recruit_follower(follower)
        @followers << follower
    end

    def cult_population
        @followers.length
    end

    def self.find_by_name(cult_name)
        Cult.all.each do |cult|
            if cult_name == cult.name
                return cult 
            end
        end
        nil
    end

    def self.find_by_location(cult_location)
        Cult.all.select do |cult|
            cult_location == cult.location
        end
    end

     def self.find_by_founding_year(year)
        Cult.all.select do |cult|
            year == cult.founding_year
        end

    end
    



end