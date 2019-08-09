require "pry"
class Follower

    attr_accessor :name, :age, :life_motto, :cults

    @@all = []

    def initialize(attributes)
        @name = attributes[:name]
        @age = attributes[:age]
        @life_motto = attributes[:life_motto]
        @cults = []
        @@all << self
    end

    def self.all
        @@all
    end

    def join_cult(cult)
        @cults << cult
    end

    def self.of_a_certain_age(age)
        @@all.select do |followers|
            followers.age >= age
        end
    end

    def my_cults_slogans
        self.cults.map do |cult|
            cult.slogan
        end
    end

end