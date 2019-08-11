require 'pry'

class Follower

  attr_reader :name
  attr_accessor :age, :life_motto

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

  def self.of_a_certain_age(age)
    self.all.select do |follower|
      follower.age >= age
    end
  end

  def self.most_active
    self.all.max_by {|follower| follower.cults.length}
  end

  def self.top_ten
    self.all.max_by(10) {|follower| follower.cults.length}
  end

  def join_cult(cult)
    if self.age >= cult.minimum_age
      Bloodoath.new(cult, self)
    else
      puts "I'm sorry, you must be #{cult.minimum_age} or older to take the blood oath and join the #{cult.name} cult."
    end
  end

  def cults
    my_cults = []
    Bloodoath.all.each do |oath|
      my_cults << oath.cult if oath.follower == self
    end
    my_cults
  end

  def my_cults_slogans
    self.cults.each {|cult| puts cult.slogan}
  end
  #this puts the slogans and returns the original array; deliverables don't specifiy a return

  def fellow_cult_members
    Follower.all.select do |follower|
      follower.cults.sort_by {|cult| cult.object_id} == self.cults.sort_by {|cult| cult.object_id} if follower != self
    end
  end
  #this will only return an array of followers who are in the EXACT same cults as you
  
  #if you want people who are in at least one cult with you:
  def fellow_cult_members_inclusive
    fellows = []
    Cult.all.each do |cult|
      if cult.get_followers.include?(self)
        cult.get_followers.each { |follower| fellows << follower if follower != self }
      end
    end
    fellows.uniq
  end


end #end of Follower class

