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

    def average_age
        total = 0 
        self.followers.each do |follower|
            total = total+follower.age 
        end 
        total/(@followers.length*1.0)
    end 

    def my_followers_mottos
        motto_array = []
        self.followers.each { |follower| motto_array << follower.life_motto }
        motto_array.each { |motto| puts motto }
    end 

    # returns the Cult instance who has the least number of followers :(
        # should return bobs_burger_cult
    def self.least_popular
        # create an empty array
        # access all of the cults 
        # access all the followers
        # method that will count the number of followers (cult_population)
        num_followers = []

        Cult.all.each do |cult|
            num_followers << cult.cult_population
        end

        lowest_num = num_followers.sort[0]

        Cult.all.find do |cult|
            cult.cult_population == lowest_num
        end

    end

    def self.most_common_location
        num_of_cults = []

        Cult.all.each do |cult|
            num_of_cults << cult.location
        end

        city_with_cults = Hash.new(0)
        num_of_cults.each do |city|
            city_with_cults[city] +=1
        end 

        city_with_cults.max_by{|k,v| v}.first

        # # max_num = num_followers.sort.last

        # # Cult.all.find do |cult|
        # #     cult.cult_population == max_num
        # end
    end

end