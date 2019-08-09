require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
c1 = Cult.new("The All Seeing Eye", "Texas", 1999, "I see you!")
c2 = Cult.new("The Crazies", "New York", 2000, "Love!" )
c3 = Cult.new("Flatiron", "New York", 2009, "Learn, Love, Code")
c4 = Cult.new("Soul Cycle", "New York", 2010, "OMG BIKES!")
c5 = Cult.new("Crossfit", "Oregon", 2111, "BULKING! AND GAINS")

f1 = Follower.new("Dan", 19, "This is fine.")
f2 = Follower.new("Belinda", 36, "Keep on going!")
f3 = Follower.new("Evans", 88, "Bloop!")
f4 = Follower.new("Pishi", 4, "Meow!")
f5 = Follower.new("Pishi", 4, "Meow!")
f6 = Follower.new("Pishi", 4, "Meow!")
f7 = Follower.new("Pishi", 4, "Meow!")
f8 = Follower.new("Pishi", 4, "Meow!")
f9 = Follower.new("Pishi", 4, "Meow!")
f10 = Follower.new("Pishi", 4, "Meow!")
f11 = Follower.new("Pishi", 4, "Meow!")
f12 = Follower.new("Pishi", 4, "Meow!")
f13 = Follower.new("Pishi", 4, "Meow!")
f14 = Follower.new("Pishi", 4, "Meow!")
f15 = Follower.new("Pishi", 4, "Meow!")
f16 = Follower.new("Pishi", 4, "Meow!")

bo1 = BloodOath.new(c1, f1, "2019-08-09")
bo2 = BloodOath.new(c2, f2, "1999-06-06")
bo3 = BloodOath.new(c4, f3, "2001-01-01")
bo4 = BloodOath.new(c3, f4, "2002-01-04")
bo5 = BloodOath.new(c2, f16, "1996-05-01")
bo6 = BloodOath.new(c1, f1, "2019-08-09")
bo7 = BloodOath.new(c4, f2, "1999-06-06")
bo8 = BloodOath.new(c1, f3, "2001-01-01")
bo9 = BloodOath.new(c3, f4, "2002-01-04")
bo10 = BloodOath.new(c2, f12, "1996-05-01")
bo11 = BloodOath.new(c5, f10, "2019-08-09")
bo12 = BloodOath.new(c3, f12, "1999-06-06")
bo13 = BloodOath.new(c1, f13, "2001-01-01")
bo14 = BloodOath.new(c3, f14, "2002-01-04")
bo15 = BloodOath.new(c2, f1, "1996-05-01")

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
