class Follower
    
    attr_accessor :name, :age, :life_motto, :cults

    @@all = []

    def initialize (name, age, life_motto)
        @name = name 
        @age = age 
        @life_motto = life_motto 
        @cults = []
        @@all << self 
    end 

    def self.all
        @@all 
    end 

    def join_cult(initiation_date, cult)
        BloodOath.new(initiation_date, self, cult) 
    end 

    def self.of_a_certain_age(age)
        @@all.select do |follower|
            follower.age >= 22 
        end 
    end 

    def my_cults_slogans
        BloodOath.all.select do |bloodoath|
            if bloodoath.follower == self 
                puts bloodoath.cult.slogan 
            end 
        end 
    end 

    def number_of_cults
        BloodOath.all.select {|bloodoath| bloodoath.follower == self}.count
    end
    
    def self.most_active
        tracker_hash = Hash.new(0)

         BloodOath.all.each do |bloodoath|
            tracker_hash[bloodoath.follower] = bloodoath.follower.number_of_cults
        end
        tracker_hash.max_by {|k, v| v}[0]
    end
        
end 