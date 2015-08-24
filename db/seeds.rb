# Create custom users

me = User.new(
  name: 'Jan Kroezen',
  email: 'jankroezen@me.com',
  password: 'testpassword'
)
me.skip_confirmation!
me.save!

heisenberg = User.new(
  name: 'Walter White',
  email: 'thecook@lospollos.net',
  password: 'heisenberg'
)
heisenberg.skip_confirmation!
heisenberg.save!

smurf = User.new(
  name: 'Papa Smurf',
  email: 'thebigs@smurfvillage.io',
  password: 'mushroom'
)
smurf.skip_confirmation!
smurf.save!


# Create additional users

2.times do
  user = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Lorem.characters(10)
  )
  user.skip_confirmation!
  user.save!
end

users = User.all


# Create ToDo items

50.times do
  Item.create!(
    user: users.sample,
    name: Faker::Lorem.sentence
  )
end


# How many Users and Items created?

puts "#{User.count} users created."
puts "#{Item.count} to-do items created."
