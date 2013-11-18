# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

puts 'SEEDING USERS'

users = [
  {
    :first_name => 'Jean',
    :last_name => 'PALE',
    :email => 'jpale@example.com',
    :password => 'iloveactivities',
    :password_confirmation => 'iloveactivities',
    :fake => true,
  },
  {
    :first_name => 'Anne',
    :last_name => 'CHTITEGOUTE',
    :email => 'anne@example.com',
    :password => 'iloveactivities',
    :password_confirmation => 'iloveactivities',
    :fake => true,
  },
  {
    :first_name => 'Corinne',
    :last_name => 'CHTITEGOUTE',
    :email => 'corinne@example.com',
    :password => 'iloveactivities',
    :password_confirmation => 'iloveactivities',
    :fake => true,
  },
  {
    :first_name => 'Justine',
    :last_name => 'CHTITEGOUTE',
    :email => 'justine@example.com',
    :password => 'iloveactivities',
    :password_confirmation => 'iloveactivities',
    :fake => true,
  },
]

users.each do |user_hash|
  user = User.create!(user_hash)
  puts "Fake user created: #{user.fullname}"
end
