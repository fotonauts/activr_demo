# encoding: utf-8

class LikePictureActivity < Activr::Activity

  entity :actor, :class => User, :humanize => :fullname
  entity :picture, :humanize => :title

  humanize "{{{actor}}} likes the picture {{{picture}}}"

end
