class BloodOath

    attr_accessor :start_date, :follower, :cult

    @@all = []

    def initialize(start_date, follower, cult)
        @start_date = start_date
        @follower = follower
        @cult = cult 
        @@all << self
    end 
end