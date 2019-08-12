require "pry"

class Follower

    attr_accessor :name, :age, :life_motto, :cults

    @@all = []

    def initialize(attributes)
        @name = attributes[:name]
        @age = attributes[:age]
        @life_motto = attributes[:life_motto]
        @@all << self
    end

    # Returns an array of all the followers
    def self.all
        @@all
    end

    # Returns an array of this follower's cults
    def cults
        my_blood_oaths = BloodOath.all.select do |blood_oath| 
            blood_oath.follower == self
        end
        my_blood_oaths.map do |my_blood_oath|
            my_blood_oath.cult
        end
    end

    # Takes in an argument of a cult instance and adds this follower to the cult's list of followers
    def join_cult(cult, initiation)
        if self.age >= cult.minimum_age
            BloodOath.new({cult: cult, follower: self, initiation: initiation})
        else 
            puts "Sorry, you are too young to join."
        end
    end

    # takes a Fixnum argument that is an age and returns an Array of followers who are the given age or older
    def self.of_a_certain_age(age)
        self.all.select{|follower| follower.age >= age}
    end

    # prints out all of the slogans for this follower's cults
    def my_cults_slogans
        self.cults.map{|cult| cult.slogan}
    end

    # returns the Follower instance who has joined the most cults
    def self.most_active(top_ranks)
        self.all.max(top_ranks){|follower1, follower2| follower1.cults.count <=> follower2.cults.count}
    end

    # returns an Array of followers; they are the ten most active followers
    def self.top_ten
        self.most_active(10)
    end

    # Returns a unique array of followers who are in the same cult as you
    def fellow_cult_members
        BloodOath.all.select{|blood_oath| self.cults.include?(blood_oath.cult)}.
                      map{|my_cults_blood_oath| my_cults_blood_oath.follower}.
                      uniq. # all followers that are in my cults (including me)
                      reject{|follower| follower == self} # remove myself
    end

end