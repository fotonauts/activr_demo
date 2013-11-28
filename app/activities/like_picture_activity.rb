# encoding: utf-8

class LikePictureActivity < Activr::Activity

  entity :actor,   :class => User,    :humanize => :fullname
  entity :picture, :class => Picture, :humanize => :title

  humanize "{{{actor}}} likes the picture {{{picture}}}"

end
