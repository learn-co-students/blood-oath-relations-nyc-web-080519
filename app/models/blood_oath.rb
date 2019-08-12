class BloodOath

    attr_reader :cult, :follower, :initiation

    @@all = []

    def initialize(attributes)
        @cult = attributes[:cult]
        @follower = attributes[:follower]
        @initiation = attributes[:initiation]
        @@all << self
    end

    # returns an Array of all the blood oaths
    def self.all
        @@all
    end

    # returns a String that is the initiation date of this blood oath in the format YYYY-MM-DD
    def intiation_date
        self.initiation
    end

    # returns the Follower instance for the follower that made the very first blood oath
    def self.first_oath
        self.all[0].follower
    end

end