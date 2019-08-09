require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console


f1 = Follower.new({name: 'andy', age: 22, life_motto: 'be happy'})
f2 = Follower.new({name: 'chris', age: 30, life_motto: 'be sad'})
f3 = Follower.new({name: 'rutger', age: 28, life_motto: 'be full'})
f4 = Follower.new({name: 'emma', age: 25, life_motto: 'be cool'})
f5 = Follower.new({name: 'johnb', age: 25, life_motto: 'be whatever'})


c1 = Cult.new({name: 'cult1', location: 'nyc', founding_year: 2019, slogan: 'one of us'})
c2 = Cult.new({name: 'cult2', location: 'louisianna', founding_year: 1902, slogan: "yep, we're still around"})
c3 = Cult.new({name: 'cult3', location: 'nyc', founding_year: 2012, slogan: 'another one of us'})
c4 = Cult.new({name: 'cult4', location: 'chicago', founding_year: 2012, slogan: 'another one of us'})
#c5 = Cult.new({name: 'cult5', location: 'chicago', founding_year: 2012, slogan: 'another one of us'})

c1.recruit_follower(f1, 2019)
c1.recruit_follower(f3, 2019)
c1.recruit_follower(f4, 2018)
c2.recruit_follower(f2, 2020)

bo1 = BloodOath.new({cult: c1, follower: f3, initiation:"1999-01-05"})
bo2 = BloodOath.new({cult: c1, follower: f1, initiation: '2018-01-05'})
bo3 = BloodOath.new({cult: c2, follower: f4, initiation: '1999-10-05'})

#f2.my_cults_slogans

binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
