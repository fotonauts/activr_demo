class Picture

  include Mongoid::Document

  attr_accessible :title, :fake, :featured, :owner, :albums, :likers

  field :title, :type => String
  field :fake, :type => Boolean, :default => false
  field :featured, :type => Boolean, :default => false

  belongs_to :owner, :class_name => "User", :inverse_of => :pictures
  has_and_belongs_to_many :albums, :class_name => "Album", :inverse_of => :pictures
  has_and_belongs_to_many :likers, :class_name => "User", :inverse_of => :likes

  validates_presence_of :title

end
