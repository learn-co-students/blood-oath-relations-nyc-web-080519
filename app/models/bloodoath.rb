require 'pry'

class BloodOath

    attr_reader :follower, :cult, :date

    @@all = []

    def initialize(follower, cult, date)
        @follower = follower
        @cult = cult 
        @date = date
        @@all << self
    end

    def self.all
        @@all
    end


end # end of class

