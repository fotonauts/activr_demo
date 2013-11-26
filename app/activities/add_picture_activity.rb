# encoding: utf-8

class AddPictureActivity < Activr::Activity

  entity :actor, :class => User
  entity :picture, :class => Picture
  entity :album, :class => Album

  def humanize
    Activr.sentence("{{actor.fullname}} added {{picture.title}} in the album {{album.name}}", self.humanization_bindings)
  end

end
