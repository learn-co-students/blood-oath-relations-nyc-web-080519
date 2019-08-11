require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

cult1 = Cult.new("Cult1", "location1", 2005, "Cult One is the Best", 3)
cult2 = Cult.new("Cult2", "location3", 1998, "Cult Two is the Best", 6)
cult3 = Cult.new("Cult3", "location3", 1988, "Cult Three is the Best", 23)
cult4 = Cult.new("Cult4", "location3", 2018, "Cult Four is the Best", 45)

follower1 = Follower.new("follower1", 50, "always follow the One")
follower2 = Follower.new("follower2", 90, "always follow the Two")
follower3 = Follower.new("follower3", 20, "always follow the Three")
follower4 = Follower.new("follower4", 80, "always follow the Four")
follower5 = Follower.new("follower5", 40, "always follow the Five")

bloodoath1 = cult1.recruit_follower(follower1, "1999-07-19")
bloodoath2 = cult1.recruit_follower(follower2, "2010-09-24")
bloodoath3 = cult2.recruit_follower(follower3, "2018-10-26")
bloodoath4 = cult4.recruit_follower(follower3, "1988-03-12")
bloodoath5 = cult4.recruit_follower(follower4, "1907-05-30")

bloodoath6 = follower1.join_cult(cult2, "2018-07-15")
bloodoath7 = follower1.join_cult(cult3, "1996-02-14")
bloodoath8 = follower5.join_cult(cult4, "2020-08-13")
bloodoath9 = follower5.join_cult(cult1, "1800-12-23")
bloodoath10 = follower2.join_cult(cult4, "1999-14-24")

cult1.average_age


binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
