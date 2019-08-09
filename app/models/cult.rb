require "pry"
class Cult

    attr_reader :founding_year
    attr_accessor :name, :location, :slogan, :followers

    @@all = []
    @@highest_location = []

    def initialize(attributes)
        @name = attributes[:name]
        @location = attributes[:location]
        @founding_year = attributes[:founding_year]
        @slogan = attributes[:slogan]
        @@all << self
    end

    def recruit_follower(follower, initiation)
        BloodOath.new({cult: self, follower: follower, initiation: initiation})
    end

    def cult_population
        BloodOath.all.select do |blood_oath|
            blood_oath.cult == self
        end.count
    end

    def self.all
        @@all
    end

    def self.find_by_name(name)
        @@all.select do |cults|
            cults.name == name
        end
    end

    def self.find_by_location(location)
        @@all.select do |cults|
            cults.location == location
        end
    end

    def self.find_by_founding_year(founding_year)
        @@all.select do |cults|
            cults.founding_year == founding_year
        end
    end

    def my_followers
        my_blood_oaths = BloodOath.all.select do |blood_oath|
            blood_oath.cults == self
        end
        my_blood_oaths.map do |blood_oath|
            blood_oath.follower
        end
    end

    def average_age
        followers_age = self.my_followers.map do |followers|
            followers.age
        end
        (followers_age.reduce(:+)/followers_age.length).to_f
    end

    def my_followers_mottos
        self.followers.map do |followers|
            followers.life_motto
        end
    end

    def self.least_popular
        self.all.min{ |a, b| a.followers.length <=> b.followers.length }
    end

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
                @@highest_location << location
            end
        end
        @@highest_location
    end
end