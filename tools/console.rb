require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


c1 = Cult.new("SJD", "anywhere", 2001, "21st century cult")
f1 = Follower.new("Susan", 34, "For the cult!")
# c1.recruit_follower(f1)
f1.join_cult(c1)



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
