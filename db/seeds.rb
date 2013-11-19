# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

puts 'SEEDING USERS'

users_infos = {
  'jpale' => {
    :first_name => 'Jean',
    :last_name => 'PALE',
    :email => 'jpale@example.com',
  },
  'anne' => {
    :first_name => 'Anne',
    :last_name => 'CHTITEGOUTE',
    :email => 'anne@example.com',
  },
  'corinne' => {
    :first_name => 'Corinne',
    :last_name => 'CHTITEGOUTE',
    :email => 'corinne@example.com',
  },
  'justine' => {
    :first_name => 'Justine',
    :last_name => 'CHTITEGOUTE',
    :email => 'justine@example.com',
  },
}

users = { }

users_infos.each do |user_id, user_hash|
  users[user_id] = User.create!(user_hash.merge({
    :fake => true,
    :password => 'iloveactivities',
    :password_confirmation => 'iloveactivities',
  }))

  puts "Fake user created: #{users[user_id].fullname}"
end

users['anne'].remote_avatar_url = 'http://s3.amazonaws.com/uifaces/faces/twitter/jackiesaik/128.jpg'
users['anne'].save


puts
puts 'SEEDING PICTURES AND ALBUMS'

albums_infos = {
  'jpale' => {
    'My Selfies' => [ 'Look at me', 'I am here', 'I do this', 'I eat that' ],
  },

  'anne' => {
    'Bugs life' => [ 'A pretty spider', 'My little coccinnelle', 'Ants ants ants' ],
  },

  'corinne' => {
    'I know what I did last summer' => [ 'The beach', 'Coconuts' ],
  },

  'justine' => {
    'LOLCATS' => [ 'LOLCAT', 'LOOOOL', 'p0Wn3d', 'NO WAAAAYYYY' ],
  },
}

albums = { }
pictures = { }

albums_infos.each do |user_id, album_infos|
  album_infos.each do |album_name, pictures_titles|
    album = Album.create!({
      :name  => album_name,
      :owner => users[user_id],
      :fake  => true,
    })

    pictures_titles.each do |picture_title|
      picture = Picture.create!({
        :title => picture_title,
        :owner => users[user_id],
        :fake  => true,
      })

      puts "Fake picture created: #{picture.title}"
      pictures[picture.title] = picture

      album.pictures << picture
    end

    albums[album_name] = album

    puts "Fake album created: #{album.name}"
  end
end


puts
puts 'SEEDING RELATIONSHIPS'

users['jpale'].follow!(users['anne'])
users['jpale'].follow!(users['corinne'])
users['jpale'].follow_album!(albums['LOLCATS'])
users['jpale'].like!(pictures['p0Wn3d'])

users['anne'].follow_album!(albums['I know what I did last summer'])
users['anne'].follow_album!(albums['LOLCATS'])
users['anne'].follow!(users['jpale'])
users['anne'].follow!(users['justine'])

users['corinne'].like!(pictures['Look at me'])
users['corinne'].like!(pictures['LOOOOL'])
users['corinne'].like!(pictures['My little coccinnelle'])

users['justine'].follow!(users['jpale'])
