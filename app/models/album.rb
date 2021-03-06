class Album

  include Activr::Entity::ModelMixin

  activr_entity :feed_index => true, :deletable => true

  include Mongoid::Document

  # fields
  field :name, :type => String
  field :fake, :type => Boolean, :default => false

  # validation
  validates_presence_of :name

  # relationships
  belongs_to :owner, :class_name => "User", :inverse_of => :albums
  has_and_belongs_to_many :pictures, :class_name => "Picture", :inverse_of => :albums
  has_and_belongs_to_many :followers, :class_name => "User", :inverse_of => :following_albums

  # callbacks
  after_destroy :delete_activities!


  def cover
    self.pictures.first || Picture.default_picture
  end

  def add_picture(picture, user)
    unless self.pictures.include?(picture)
      self.pictures << picture

      # dispatch activity
      Activr.dispatch!(AddPictureActivity.new(:actor => user, :picture => picture, :album => self))
    end
  end

end
