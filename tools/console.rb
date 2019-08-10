require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

heavensgate = Cult.new("Heaven's Gate", "California", 1977, "Hale Bopp!")
jonestown = Cult.new("Jonestown", "Guyana", 1981, "We love kool-aid!")
branch_dividians = Cult.new("Branch Dividians", "Waco, TX", 1981, "Stop drop and roll!")
scientology = Cult.new("Scientology", "Los Angeles", 2001, "John Travolta is a good actor!")
crossfit = Cult.new("Crossfit", "California", 2008, "You're guaranteed to get injured!")

jim_jones = Follower.new("Jim Jones", 56, "Drink the koolaid")
marshall_applewhite = Follower.new("Marshall Applewhite", 56, "DO")
david_caresh = Follower.new("David Caresh", 28, "Jesus is rad")
john_travolta = Follower.new("John Travolta", 65, "I'm gonna tear his face off")
tom_cruise = Follower.new("Tom Cruise", 58, "Mission Impossible")
bruh = Follower.new("Bruh", 24, "I can squat my bodyweight")
bro = Follower.new("Bro", 24, "I can squat double my bodyweight")
brody = Follower.new("Brody", 24, "I can bench my bodyweight")
chad = Follower.new("Chad", 24, "I can clean my bodyweight")
koolaid_man = Follower.new("Kool-Aid Man", 69, "Oh yeah!")
not_a_joiner = Follower.new("Jane", 45, "no cults for me")

marshall_applewhite.join_cult(heavensgate)
jim_jones.join_cult(jonestown)
david_caresh.join_cult(branch_dividians)
chad.join_cult(crossfit)
bro.join_cult(crossfit)
bruh.join_cult(crossfit)
brody.join_cult(crossfit)
brody.join_cult(scientology)
brody.join_cult(heavensgate)
scientology.recruit_follower(tom_cruise)
tom_cruise.join_cult(crossfit)
tom_cruise.join_cult(heavensgate)

scientology.recruit_follower(john_travolta)
scientology.recruit_follower(bruh)
jonestown.recruit_follower(koolaid_man)
heavensgate.recruit_follower(koolaid_man)
#branch_dividians.recruit_follower(koolaid_man)
crossfit.recruit_follower(koolaid_man)
scientology.recruit_follower(koolaid_man)






binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
