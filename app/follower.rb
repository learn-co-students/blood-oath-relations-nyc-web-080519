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

  def join_cult(cult)
    Bloodoath.new(cult, self)
  end

  def cults
    my_cults = []
    Bloodoath.all.each do |oath|
      my_cults << oath.cult if oath.follower == self
    end
    my_cults
  end

  def self.of_a_certain_age(age)
    self.all.select do |follower|
      follower.age >= age
    end
  end

  def my_cults_slogans
    self.cults.each {|cult| puts cult.slogan}
  end
  #this puts the slogans and returns the original array; deliverables don't specifiy a return

  def self.most_active
    self.all.max_by {|follower| follower.cults.length}
  end

  def self.top_ten
    self.all.max_by(10) {|follower| follower.cults.length}
  end



end #end of Follower class