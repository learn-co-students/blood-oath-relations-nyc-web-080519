require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


c1 = Cult.new("Cult One", "New York", 2017, "I love One")
c2 = Cult.new("Cult Two", "Paris", 2007, "I love Two")
c3 = Cult.new("Cult Three", "San Francisco", 1997, "I love Three")
c4 = Cult.new("Cult Four", "San Francisco", 1987, "I love Four")
c5 = Cult.new("Cult Five", "Seattle", 1977, "I love Five")

f1 = Follower.new("Follower One", 21, "I am Follower One")
f2 = Follower.new("Follower Two", 22, "I am Follower Two")
f3 = Follower.new("Follower Three", 23, "I am Follower Three")
f4 = Follower.new("Follower Four", 24, "I am Follower Four")
f5 = Follower.new("Follower Five", 25, "I am Follower Five")

f1.join_cult(2017, c1)
f2.join_cult(2017, c1)
f3.join_cult(2017, c1)
f4.join_cult(2017, c1)
f5.join_cult(2017, c1)


c2.recruit_follower(2015, f2)

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
 