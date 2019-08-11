class Cult
    attr_reader :name, :location, :founding_year, :slogan, :minimun_age
    @@all = []

    def initialize(name, location, founding_year, slogan, minimun_age)
        @name = name
        @location = location
        @founding_year = founding_year
        @slogan = slogan
        @minimun_age = minimun_age
        @@all << self
    end

    #Takes an argument of a Follower instance
    #Adds them to the cult's list through a Bloodoath
    def recruit_follower(follower, date)
        if follower.age < self.minimun_age
            return "You are too young to join this cult"
        else
            return Bloodoath.new(self, follower, date)
        end
    end

    #Returns the Cult's number of Followers
    def cult_population
        Bloodoath.all.select {|bloodoath| bloodoath.cult == self}.count
    end

    def self.all
        @@all
    end

    #Takes a name argument 
    #Returns a Cult instance whose name matches
    def self.find_by_name(given_name)
        self.all.find {|cult| cult.name == given_name}
    end

    #Take a location argument
    #Returns an Array of Cults in that location
    def self.find_by_location(given_location)
        self.all.select {|cult| cult.location == given_location}
    end

    #Take the year argument
    #Returns all the cults founded in that year
    def self.find_by_founding_year(given_yr)
        self.all.select {|cult| cult.founding_year == given_yr}
    end

    #Returns a Float that is the average age of THIS'S CULT'S follower
    def average_age
        sum = 0.0
        count = Bloodoath.all.select do |bloodoath|
            if bloodoath.cult == self
                sum += bloodoath.follower.age
            end
        end
        sum/count.length
    end

    #Prints out all the mottos for this Cult's followers
    def my_followers_mottos
        Bloodoath.all.each do |bloodoath|
            if bloodoath.cult == self
                puts bloodoath.follower.life_motto
            end
        end
    end

    #Returns the Cult who has the least number of followers
    def self.least_popular
        amt_follower = Hash.new(0)
        Bloodoath.all.each do |bloodoath|
            amt_follower[bloodoath.cult] = bloodoath.cult.cult_population
        end
        amt_follower.min_by {|k, v| v}[0]
    end

    #Returns the location (a String) with the most Cults
    #Put all locations in an array
    def self.most_common_location
        location_arr = self.all.map {|cult| cult.location}
        location_hash = Hash.new(0)

        location_arr.each do |location| 
            location_hash[location] += 1 
        end

        location_hash.max_by {|k, v| v}[0]
    end

end