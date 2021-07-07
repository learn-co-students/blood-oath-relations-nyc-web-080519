class Follower

    attr_accessor :name, :age, :life_motto, :cults

    @@all = []

    def initialize (name)
        @name = name
        @age = age
        @life_motto = life_motto
        @cults = []
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def join_cult(cult)
        @cults << cult
    end 

    def self.of_a_certain_age(age_of_follower)
        Follower.all.select do |follower|
            age_of_follower == follower.age
        end
    end 

    def my_cults_slogans
       self.cults.each do |cult|
        puts cult.slogan
       end 
    end 

    def self.most_active
        
    end 


end