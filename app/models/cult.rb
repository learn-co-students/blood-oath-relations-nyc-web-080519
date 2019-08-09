class Cult

    attr_reader :name, :location, :founding_year, :slogan

    @@all = []


    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @followers = []
        @@all << self
    end

    def recruit_follower(follower)
        @followers << follower
    end

    def cult_population
        @followers.length
    end

    def self.all
        @@all
    end

    def self.find_by_name(cult_name)
        self.all.find do |cult|
            cult.name == cult_name
        end
    end

    def self.find_by_location(cult_location)
        self.all.select do |cult|    #returns an array of Cult objects...
            cult.location == cult_location      #... that satisfy this conditional
        end
    end

    def self.find_by_year(cult_year)
        self.all.select do |cult|
            cult.founding_year == cult_year
        end
    end

end # end of class