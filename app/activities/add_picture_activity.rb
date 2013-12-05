# encoding: utf-8

class AddPictureActivity < Activr::Activity

  entity :actor, :class => User, :humanize => :fullname
  entity :picture, :humanize => :title
  entity :album, :humanize => :name

  humanize "{{{actor}}} added {{{picture}}} in the album {{{album}}}"

end
