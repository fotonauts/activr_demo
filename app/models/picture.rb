class Picture

  include Mongoid::Document

  field :_id, :type => String, :default => lambda { title ? title.parameterize : nil }

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
  validates_presence_of :title, :image

  # relationships
  belongs_to :owner, :class_name => "User", :inverse_of => :pictures
  has_and_belongs_to_many :albums, :class_name => "Album", :inverse_of => :pictures
  has_and_belongs_to_many :likers, :class_name => "User", :inverse_of => :likes


  class << self

    # default picture
    def default_picture
      @default_picture ||= Picture.find('default')
    end

  end

  # fetch last activities
  def activities(limit, skip = 0)
    Activr.activities(limit, :skip => skip, :picture => self._id)
  end

  # get total number of activities
  def activities_count
    Activr.count_activities(:picture => self._id)
  end

end
