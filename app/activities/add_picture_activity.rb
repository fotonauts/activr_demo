# encoding: utf-8

class AddPictureActivity < Activr::Activity

  entity :actor,   :class => User,    :humanize => :fullname
  entity :picture, :class => Picture, :humanize => :title
  entity :album,   :class => Album,   :humanize => :name

  humanize "{{{actor}}} added {{{picture}}} in the album {{{album}}}"

end
