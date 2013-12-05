# encoding: utf-8

class FollowAlbumActivity < Activr::Activity

  entity :actor, :class => User, :humanize => :fullname
  entity :album, :humanize => :name

  humanize "{{{actor}}} is now following the album {{{album}}}"

end
