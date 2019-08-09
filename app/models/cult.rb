class Cult

    attr_reader :name, :location, :founding_year, :slogan

    @@all = []


    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
<<<<<<< HEAD
        # @followers = []  -- don't necessarily need this array because using 'bloodoath' as join table
=======
>>>>>>> Darrow
        @@all << self
    end

    def recruit_follower(follower)
<<<<<<< HEAD
        # @followers << follower - not necessary
        BloodOath.new(follower, self, Time.now.strftime("%Y/%m/%d")) # self to refer to the cult, and put in date
    end

    def cult_population
        selected = BloodOath.all.select do |oath|
            oath.cult == self
        end
        selected.count
        # @followers.length #refactor code since we cant use @followers
        # population for specific cult not all the followers for all the cults
=======
        # add a bloodoath
        BloodOath.new(follower, self, date)
            
    end

    def cult_population
        BloodOath.all.select do |oath|
            oath.cult == self
        end
>>>>>>> Darrow
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