# Create user

user = User.new(
  name: 'Jan Kroezen',
  email: 'jankroezen@me.com',
  password: 'testpassword'
)
user.skip_confirmation!
user.save

puts "#{User.count} users created."
