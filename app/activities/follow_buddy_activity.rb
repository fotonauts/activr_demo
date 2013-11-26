# encoding: utf-8

class FollowBuddyActivity < Activr::Activity

  entity :actor, :class => User
  entity :buddy, :class => User

  def humanize
    Activr.sentence("{{actor.fullname}} is now following {{buddy.fullname}}", self.humanization_bindings)
  end

end
