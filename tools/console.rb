require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


manson = Cult.new("Manson", "Los Angeles", "1960", "Whatever")
cult2 = Cult.new("Amy's Cult", "New York City", "1993", "Blood")

ryan = Follower.new("Ryan", 25, "yolo")
person = Follower.new("Bob", 50, "whhatever")

bloodoath1 = BloodOath.new(manson, person, "2019-08-09")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
