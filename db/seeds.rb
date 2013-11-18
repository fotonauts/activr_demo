# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

puts 'SEEDING USERS'

users_hashes = [
  {
    :first_name => 'Jean',
    :last_name => 'PALE',
    :email => 'jpale@example.com',
    :password => 'iloveactivities',
    :password_confirmation => 'iloveactivities',
  },
  {
    :first_name => 'Anne',
    :last_name => 'CHTITEGOUTE',
    :email => 'anne@example.com',
    :password => 'iloveactivities',
    :password_confirmation => 'iloveactivities',
  },
  {
    :first_name => 'Corinne',
    :last_name => 'CHTITEGOUTE',
    :email => 'corinne@example.com',
    :password => 'iloveactivities',
    :password_confirmation => 'iloveactivities',
  },
  {
    :first_name => 'Justine',
    :last_name => 'CHTITEGOUTE',
    :email => 'justine@example.com',
    :password => 'iloveactivities',
    :password_confirmation => 'iloveactivities',
  },
]

users = { }

users_hashes.each do |user_hash|
  users[user_hash[:email]] = User.create!(user_hash.merge(:fake => true))
  puts "Fake user created: #{users[user_hash[:email]].fullname}"
end


puts
puts 'SEEDING PICTURES'

pictures_infos = {
  users['jpale@example.com']   => [ 'Look at me', 'I am here', 'I do this', 'I eat that' ],
  users['anne@example.com']    => [ 'A pretty spider', 'My little coccinnelle', 'Ants ants ants' ],
  users['corinne@example.com'] => [ 'The beach', 'Coconuts' ],
  users['justine@example.com'] => [ 'LOLCAT', 'LOOOOL', 'p0Wn3d ', 'NO WAAAAYYYY' ],
}

pictures = { }

pictures_infos.each do |user, pictures_titles|
  pictures[user] = [ ]

  pictures_titles.each do |picture_title|
    picture = Picture.create!({
      :title => picture_title,
      :owner => user,
      :fake  => true,
    })

    pictures[user] << picture

    puts "Fake picture created: #{picture.title}"
  end
end


puts
puts 'SEEDING ALBUMS'

albums = {
  users['jpale@example.com']   => [ 'My Selfies' ],
  users['anne@example.com']    => [ 'Bugs life' ],
  users['corinne@example.com'] => [ 'I know what I did last summer' ],
  users['justine@example.com'] => [ 'LOLCATS' ],
}

albums.each do |user, albums_names|
  albums_names.each do |album_name|
    album = Album.create!({
      :name  => album_name,
      :owner => user,
      :fake  => true,
    })

    pictures[user].each do |picture|
      album.pictures << picture
    end

    puts "Fake album created: #{album.name}"
  end
end
