# encoding: utf-8

class UserNewsFeedTimeline < Activr::Timeline

  self.recipient_class = User


  #
  # Routes
  #

  route AddPictureActivity, :to => 'picture.owner', :humanize => "{{actor.fullname}} added your picture {{picture.title}} to the album {{album.name}}"
  route AddPictureActivity, :to => 'actor.followers'
  route AddPictureActivity, :to => 'album.followers'

  route FollowAlbumActivity, :to => 'album.owner', :humanize => "{{actor.fullname}} is now following your album {{album.name}}"
  route FollowAlbumActivity, :to => 'actor.followers'

  route FollowBuddyActivity, :to => 'buddy',           :humanize => "{{actor.fullname}} is now following you"
  route FollowBuddyActivity, :to => 'actor.followers', :humanize => "{{actor.fullname}} is now following you"

  route LikePictureActivity, :to => 'picture.owner',   :humanize => "{{actor.fullname}} liked your picture {{picture.title}}"
  route LikePictureActivity, :to => 'actor.followers', :humanize => "{{actor.fullname}} liked your picture {{picture.title}}"


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
