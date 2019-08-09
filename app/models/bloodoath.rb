class BloodOath

    attr_reader :follower, :cult

    @@all = []

    def initialize(follower, cult)
        @follower = follower
        @cult = cult 
        @@all << self
    end

    def self.all
        @@all
    end
    
    def initiation_date

    end

end # end of class