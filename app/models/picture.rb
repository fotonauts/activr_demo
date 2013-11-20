class Picture

  include Mongoid::Document

  attr_accessible :title, :fake, :featured,
                  :external_url, :external_author, :external_author_url,
                  :owner, :albums, :likers

  field :_id, :type => String, :default => lambda { title.parameterize }

  # carrierwave
  mount_uploader :image, PictureUploader

  # fields
  field :title, :type => String
  field :fake, :type => Boolean, :default => false
  field :featured, :type => Boolean, :default => false

  field :external_url, :type => String
  field :external_author, :type => String
  field :external_author_url, :type => String

  # validation
  validates_presence_of :title

  # relationships
  belongs_to :owner, :class_name => "User", :inverse_of => :pictures
  has_and_belongs_to_many :albums, :class_name => "Album", :inverse_of => :pictures
  has_and_belongs_to_many :likers, :class_name => "User", :inverse_of => :likes

end
