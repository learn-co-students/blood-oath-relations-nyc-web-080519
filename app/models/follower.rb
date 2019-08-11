class Follower
    attr_accessor :name, :age, :life_motto
    @@all = []

    def initialize(name, age, life_motto)
        @name = name 
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    #Takes a Cult instance argument
    #Adds self to that Cult 
    def join_cult(cult, date)
        if self.age < cult.minimun_age
            return "You are too young to join this cult"
        else
            return Bloodoath.new(cult, self, date)
        end
    end

    def self.all
        @@all 
    end

    #Takes age as an argument
    #Returns an Array of Followers who are that given age or older
    def self.of_a_certain_age(given_age)
        self.all.select {|follower| follower.age >= given_age}
    end

    #Prints out all of the slogan for the follower's cults
    def my_cults_slogans
        Bloodoath.all.each do |bloodoath|
            if bloodoath.follower == self
                puts bloodoath.cult.slogan
            end
        end
    end

    #Return the amount of Cults the Follower is following
    def amt_cult_follow
        Bloodoath.all.select {|bloodoath| bloodoath.follower == self}.count
    end

    #Returns the Follower instance who has joined the most cults
    def self.most_active
        amt_cults = Hash.new(0)

        Bloodoath.all.each do |bloodoath|
            amt_cults[bloodoath.follower] = bloodoath.follower.amt_cult_follow
        end
        amt_cults.max_by {|k, v| v}[0]
    end

    #Returns an Array of the top 10 most active followers
    def self.top_ten
        amt_cults = Hash.new(0)

        Bloodoath.all.each do |bloodoath|
            amt_cults[bloodoath.follower] = bloodoath.follower.amt_cult_follow
        end
        sorted = amt_cults.sort_by {|k, v| v}.reverse.flatten

        sorted.select {|ele| !(ele.is_a? Integer)}
    end

    def my_cults
        my_cults_arr = []
        Bloodoath.all.each do |bloodoath|
            if bloodoath.follower == self
                my_cults_arr << bloodoath.cult
            end
        end
        my_cults_arr

        # Bloodoath.all.select do |bloodoath|
        #     if bloodoath.follower == self
        #         bloodoath.cult
        #     end
        # end
    end

    #Return an UNIQUE array of followers who follow the same Cult
    def fellow_cult_members
        fellow_followers = []

        Bloodoath.all.each do |bloodoath|
            self.my_cults.each do |cult_ele|
                if bloodoath.cult == cult_ele && bloodoath.follower != self
                    fellow_followers << bloodoath.follower
                end
            end
        end
        fellow_followers.uniq
    end
    
end