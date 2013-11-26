# encoding: utf-8

class FollowAlbumActivity < Activr::Activity

  entity :actor, :class => User
  entity :album, :class => Album

  def humanize
    Activr.sentence("{{actor.fullname}} follow album {{album.name}", self.humanization_bindings)
  end

end
