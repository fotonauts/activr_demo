# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts '== SEEDING USERS'

users_infos = {
  'jpale' => {
    :fields => {
      :first_name => 'Jean',
      :last_name => 'PALE',
      :email => 'jpale@example.com',
    },
    :remote_avatar_url => 'http://s3.amazonaws.com/uifaces/faces/twitter/exentrich/128.jpg',
  },
  'anne' => {
    :fields => {
      :first_name => 'Anne',
      :last_name => 'CHTITEGOUTE',
      :email => 'anne@example.com',
    },
    :remote_avatar_url => 'http://s3.amazonaws.com/uifaces/faces/twitter/jackiesaik/128.jpg',
  },
  'corinne' => {
    :fields => {
      :first_name => 'Corinne',
      :last_name => 'CHTITEGOUTE',
      :email => 'corinne@example.com',
    },
    :remote_avatar_url => 'http://s3.amazonaws.com/uifaces/faces/twitter/j04ntoh/128.jpg',
  },
  'justine' => {
    :fields => {
      :first_name => 'Justine',
      :last_name => 'CHTITEGOUTE',
      :email => 'justine@example.com',
    },
    :remote_avatar_url => 'http://s3.amazonaws.com/uifaces/faces/twitter/roxanejammet/128.jpg',
  },
}

users = { }

users_infos.each do |user_id, user_infos|
  user = User.create!(user_infos[:fields].merge({
    :fake => true,
    :password => 'popopopo',
    :password_confirmation => 'popopopo',
  }))

  if user_infos[:remote_avatar_url]
    puts "Fetching avatar for: #{user_id}"
    user.remote_avatar_url = user_infos[:remote_avatar_url]
    user.save rescue nil
  end

  users[user_id] = user

  puts "+ User created: #{user_id} (#{user.fullname})"
end


puts
puts '== SEEDING PICTURES AND ALBUMS'

albums_infos = {
  'jpale' => {
    'My Selfies' => {
      'Look at me' => {
        :external_url        => 'http://farm9.staticflickr.com/8081/8279653087_5f1dee29cc_z.jpg',
        :external_author     => 'Dave Parker ',
        :external_author_url => 'http://www.flickr.com/photos/daveparker/',
      },
      'I am here'  => {
        :external_url        => 'http://farm8.staticflickr.com/7451/9597511208_d2000c1995_c.jpg',
        :external_author     => 'Dave Parker ',
        :external_author_url => 'http://www.flickr.com/photos/daveparker/',
      },
      'I do this'  => {
        :external_url        => 'http://farm3.staticflickr.com/2891/9181710016_9187e7c750_c.jpg',
        :external_author     => 'Dave Parker ',
        :external_author_url => 'http://www.flickr.com/photos/daveparker/',
      },
      'I drink that' => {
        :external_url        => 'http://farm4.staticflickr.com/3781/8952663361_9b108eb666_c.jpg',
        :external_author     => 'Dave Parker ',
        :external_author_url => 'http://www.flickr.com/photos/daveparker/',
      },
    }
  },

  'anne' => {
    'Bugs life' => {
      'A pretty spider' => {
        :external_url        => 'http://farm4.staticflickr.com/3549/3664300297_405cc2c8d8_z.jpg',
        :external_author     => 'Julien GONG Min',
        :external_author_url => 'http://www.flickr.com/photos/bfishadow/',
      },
      'My little coccinnelle' => {
        :external_url        => 'http://farm8.staticflickr.com/7041/6851663286_07307bba21_c.jpg',
        :external_author     => 'Gaetan Ducatteeuw',
        :external_author_url => 'http://www.flickr.com/photos/gducatteeuw/',
      },
      'Ants ants ants' => {
        :external_url        => 'http://farm4.staticflickr.com/3671/9373182095_9e71463009_c.jpg',
        :external_author     => 'Joe Barney',
        :external_author_url => 'http://www.flickr.com/photos/sunlizard4fun/',
      },
    }
  },

  'corinne' => {
    'I know what I did last summer' => {
      'The beach' => {
        :external_url        => 'http://farm3.staticflickr.com/2019/2257233228_8778658d39_b.jpg',
        :external_author     => 'Mike Baird',
        :external_author_url => 'http://www.flickr.com/photos/mikebaird/',
      },
      'Coconuts' => {
        :external_url        => 'http://farm6.staticflickr.com/5294/5473225545_609a6f346d_b.jpg',
        :external_author     => 'thienzieyung',
        :external_author_url => 'http://www.flickr.com/photos/thienzieyung/',
      },
    }
  },

  'justine' => {
    'LOLCATS' => {
      'LOLCAT' => {
        :external_url        => 'http://farm1.staticflickr.com/177/414147772_f1249bc31f_o.jpg',
        :external_author     => 'Kevin Jarrett',
        :external_author_url => 'http://www.flickr.com/photos/kjarrett/',
      },
      'LOOOOL' => {
        :external_url        => 'http://farm2.staticflickr.com/1108/672634016_c82ca45cd2_o.jpg',
        :external_author     => 'justin_wiccan_tweb',
        :external_author_url => 'http://www.flickr.com/photos/9512083@N04/',
      },
      'p0Wn3d' => {
        :external_url        => 'http://farm2.staticflickr.com/1237/672634036_b85c710486_o.jpg',
        :external_author     => 'justin_wiccan_tweb',
        :external_author_url => 'http://www.flickr.com/photos/9512083@N04/',
      },
      'NO WAAAAYYYY' => {
        :external_url        => 'http://farm1.staticflickr.com/221/490423135_c2a908f3a0_o.jpg',
        :external_author     => 'Noah Sussman',
        :external_author_url => 'http://www.flickr.com/photos/thefangmonster/',
      },
    },
  },
}

albums = { }
pictures = { }

albums_infos.each do |user_id, albums_infos|
  albums_infos.each do |album_name, pictures_infos|
    album = Album.create!({
      :name  => album_name,
      :owner => users[user_id],
      :fake  => true,
    })

    pictures_infos.each do |picture_title, picture_hash|
      picture = Picture.create(picture_hash.merge({
        :title => picture_title,
        :owner => users[user_id],
        :fake  => true,
      }))

      if picture_hash[:external_url]
        puts "Fetching picture: #{picture_title}"
        picture.remote_image_url = picture_hash[:external_url]
        picture.save rescue nil
      end

      puts "+ Picture created: #{picture.title}"
      pictures[picture.title] = picture

      album.pictures << picture
    end

    albums[album_name] = album

    puts "+ Album created: #{album.name}"
  end
end


puts
puts '== SEEDING RELATIONSHIPS'

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


puts
puts '== SEEDING DEFAULT PICTURE'

Picture.create({
  :title => 'default',
  :owner => users['jpale'],
  :fake  => true,
})
