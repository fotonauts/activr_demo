# encoding: utf-8

class LikePictureActivity < Activr::Activity

  entity :actor, :class => User
  entity :picture, :class => Picture

  def humanize
    Activr.sentence("{{actor.fullname}} likes the picture {{picture.title}}", self.humanization_bindings)
  end

end
