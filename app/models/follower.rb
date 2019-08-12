class Follower
    attr_accessor :name, :age, :life_motto
    
    @@all = []

    def initialize(name, age, life_motto)
        @name = name
        @age = age
        @life_motto = life_motto
        @@all << self
    end

    def self.all 
        @@all
    end 

    def join_cult(cult, initiation_date)
        BloodOath.new(cult, self, initiation_date)
    end

    def cults
        BloodOath.all.select do |blood_oath|
            blood_oath.follower == self
        end
    end

    def self.of_a_certain_age(age)
        self.all.select do |follower|
            follower.age >= age
        end 
    end

    def my_cults_slogans 
        self.cults.each do |bloodOath|
            puts bloodOath.cult.slogan 
        end
        return
    end

    def self.most_active
        follower_hash = {}
        BloodOath.all.each do |bloodOath|
            if follower_hash.keys.include?(bloodOath.follower)
                #increment
                follower_hash[bloodOath.follower] += 1
            else
                #create new key/value pair
                follower_hash[bloodOath.follower] = 1
            end
        end
        biggest_num = 0
        biggest_follower = ""
        follower_hash.each do |follower, num|
            if num > biggest_num
                biggest_num = num
                biggest_follower = follower
            end
        end
        biggest_follower
    end

    def self.top_ten 
        follower_hash = {}
        top_ten_array = [] 
        BloodOath.all.each do |bloodOath|
            if follower_hash.keys.include?(bloodOath.follower)
                #increment
                follower_hash[bloodOath.follower] += 1
            else
                #create new key/value pair
                follower_hash[bloodOath.follower] = 1
            end
        end
        sorted_hash = follower_hash.sort_by {|follower, num| num}
        sorted_hash.each do |follower|
            if top_ten_array.length <= 10 
                top_ten_array << follower
            end
        end
    end





end #end of Follower class 