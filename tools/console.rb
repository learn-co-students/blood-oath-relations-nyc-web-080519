require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
blood_lovers_cult = Cult.new("BloodLovers")
blood_lovers_cult.location = "New York"
blood_lovers_cult.slogan = "ABC"
blood_lovers_cult.founding_year = 1984


puppy_lovers_cult = Cult.new("PuppyLovers")
puppy_lovers_cult.slogan = "DEF"
puppy_lovers_cult.location = "Mexico City"

puppy_lovers_cult.founding_year = 1987



bobs_burger_cult = Cult.new("BobsBurger")
bobs_burger_cult.slogan = "GHI"
bobs_burger_cult.location = "Mexico City"

bobs_burger_cult.founding_year = 1987

jim = Follower.new("Jim")
jim.age = 19
jim.life_motto = "To be or not to be"
sarah = Follower.new("Sarah")
sarah.age = 20
tina = Follower.new("Tina")
tina.age = 21
harry = Follower.new("Harry")
harry.age = 22

bo1 = BloodOath.new("2019/11/20", jim, blood_lovers_cult)
bo2 = BloodOath.new("2019/11/20", jim, puppy_lovers_cult)
bo3 = BloodOath.new("2019/11/20", tina, blood_lovers_cult)
bo4 = BloodOath.new("2019/11/20", harry, blood_lovers_cult)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits


