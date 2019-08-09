class Follower

    attr_reader :name, :age, :life_motto, :cults

    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def join_cult(cult)         #i like cookies
        # add a bloodoath
        BloodOath.new(self, cult, date)
    end
    
    def self.all
       @@all 
    end

    def self.of_a_certain_age(follower_age)
        self.all.select do |follower|
            follower_age >= follower.age 
        end
    end

end # end of class