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

    # def join_cult(cult)
    #     @cults << cult
    #     cult.recruit_follower(self)
    # end 

    def self.of_a_certain_age(age)
        
    end 


end