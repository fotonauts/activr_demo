# encoding: utf-8

class FollowBuddyActivity < Activr::Activity

  entity :actor, :class => User
  entity :buddy, :class => User

  def humanize
    Activr.sentence("{{actor}} is now following {{buddy}}")
  end

end
