# encoding: utf-8

class FollowBuddyActivity < Activr::Activity

  entity :actor, :class => User, :humanize => :fullname
  entity :buddy, :class => User, :humanize => :fullname

  humanize "{{actor}} is now following {{buddy}}"

end
