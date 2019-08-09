class BloodOath

    attr_reader :cult, :follower, :initiation

    @@all = []

    def initialize(attributes)
        @cult = attributes[:cult]
        @follower = attributes[:follower]
        @initiation = attributes[:initiation]
        @@all << self
    end

    def self.all
        @@all
    end

    def intiation_date
        self.initiation
    end

end