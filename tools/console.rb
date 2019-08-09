require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
blood_lovers_cult = Cult.new("BloodLovers")
blood_lovers_cult.location = "New York"
blood_lovers_cult.founding_year = 1984


puppy_lovers_cult = Cult.new("PuppyLovers")
puppy_lovers_cult.location = "Paris"
puppy_lovers_cult.founding_year = 1987



bobs_burger_cult = Cult.new("BobsBurger")
bobs_burger_cult.location = "Mexico City"
bobs_burger_cult.founding_year = 1987

jim = Follower.new("Jim")
sarah = Follower.new("Sarah")
tina = Follower.new("Tina")
harry = Follower.new("Harry")

bo1 = BloodOath.new("2019/11/20",jim, blood_lovers_cult)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits


