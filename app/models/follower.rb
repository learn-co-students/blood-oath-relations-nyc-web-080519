class Follower
    attr_reader :name, :age, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def cults
        #look at all bloodoaths
        #select the bloodoaths for this follower
        #select the cults name
        self.my_bloodoaths.map do |bloodoath|
            bloodoath.cult.name
        end
    end

    def join_cult(cult, date)
        BloodOath.new(cult, self, date)
    end

    def self.all
        @@all
    end

    def self.of_a_certain_age(age)
        self.all.select do |follower|
            follower.age >= age
        end
    end

    def my_bloodoaths
        BloodOath.all.select do |bloodoath|
            bloodoath.follower == self 
        end
    end

    def my_cults_slogans
        self.my_bloodoaths.each do |bloodoath|
            puts bloodoath.cult.slogan
        end
    end

    def self.most_active
        self.all.max do |follower1, follower2|
            follower1.cults.count <=> follower2.cults.count
        end
    end

    def self.top_ten
        self.all.max(10) do |follower1, follower2|
            follower1.cults.count <=> follower2.cults.count
        end
    end

    def fellow_cult_members
        #follower.bloodoaths returns array of bloodoaths for that follower
        #cults.bloodoaths returns an array of bloodoaths for that cult
        my_cults = self.my_bloodoaths.map do |bloodoath|
            bloodoath.cult
        end
        cult_bloodoaths = my_cults.map do |cult|
            cult.my_bloodoaths
        end
        cult_followers = cult_bloodoaths.flatten.map do |bloodoath|
            #binding.pry
            bloodoath.follower
        end
        cult_followers.delete(self)
        cult_followers.uniq
    end
end