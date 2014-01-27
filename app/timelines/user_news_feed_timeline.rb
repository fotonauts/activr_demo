# encoding: utf-8

class UserNewsFeedTimeline < Activr::Timeline

  recipient User

  # trim timeline
  max_length 100


  #
  # Routes
  #

  route AddPictureActivity, :to => 'picture.owner', :humanize => "{{{actor}}} added your picture {{{picture}}} to the album {{{album}}}"
  route AddPictureActivity, :to => 'actor.followers'
  route AddPictureActivity, :to => 'album.followers'

  route FollowAlbumActivity, :to => 'album.owner', :humanize => "{{{actor}}} is now following your album {{{album}}}"
  route FollowAlbumActivity, :to => 'actor.followers'

  route FollowBuddyActivity, :to => 'buddy', :humanize => "{{{actor}}} is now following you"
  route FollowBuddyActivity, :to => 'actor.followers'

  route LikePictureActivity, :to => 'picture.owner', :humanize => "{{{actor}}} liked your picture {{{picture}}}"
  route LikePictureActivity, :to => 'actor.followers'


  #
  # Callbacks
  #

  def should_handle_activity?(activity, route)
    # return `false` to skip activity routing
    true
  end

  def should_store_timeline_entry?(timeline_entry)
    # return `false` to cancel timeline entry storing
    true
  end

  def will_store_timeline_entry(timeline_entry)
    # last chance to modify timeline entry before storing
  end

  def did_store_timeline_entry(timeline_entry)
    # eg: now you can send notifications
  end

end
