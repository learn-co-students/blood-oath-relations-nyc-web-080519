require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


manson = Cult.new("Manson", "Los Angeles", "1960", "Whatever")
cult2 = Cult.new("Amy's Cult", "New York City", "1993", "Blood")
cult3 = Cult.new("Evans' Cult", "Flatiron", "2019", "Spicy")
cult4 = Cult.new("Dan's Cult", "Flatiron", "2019", "I love Essen")

ryan = Follower.new("Ryan", 25, "yolo")
person = Follower.new("Bob", 50, "whhatever")
person2 = Follower.new("person2", 25, "2")
person3 = Follower.new("person3", 50, "3")
person4 = Follower.new("person4", 25, "4")
person5 = Follower.new("person5", 50, "5")
person6 = Follower.new("person6", 25, "6")
person7 = Follower.new("person7", 50, "7")
person8 = Follower.new("person8", 25, "8")
person9 = Follower.new("person9", 50, "9")
person10 = Follower.new("person10", 25, "10")
person11 = Follower.new("person11", 50, "11")

bloodoath1 = BloodOath.new(manson, person, "2019-08-09")
bloodoath2 = BloodOath.new(cult2, person, "2019=08-09")
bloodoath3 = BloodOath.new(cult2, person2, "2019-08-09")
bloodoath4 = BloodOath.new(manson, person3, "2019-08-09")
bloodoath5 = BloodOath.new(cult2, person4, "2019=08-09")
bloodoath6 = BloodOath.new(cult2, person5, "2019-08-09")
bloodoath7 = BloodOath.new(manson, person5, "2019-08-09")
bloodoath8 = BloodOath.new(cult2, person6, "2019=08-09")
bloodoath9 = BloodOath.new(cult2, person7, "2019-08-09")
bloodoath10 = BloodOath.new(manson, person8, "2019-08-09")
bloodoath11 = BloodOath.new(cult2, person9, "2019=08-09")
bloodoath12 = BloodOath.new(cult2, person10, "2019-08-09")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
