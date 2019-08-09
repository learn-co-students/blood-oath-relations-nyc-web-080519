require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

c1 = Cult.new("furries", "everywhere", 2006, "we like fur")
f1 = Follower.new("Darrow", 22, "idk")

c1.recruit_follower(f1)




binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
