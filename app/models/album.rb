class Album

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


  def cover
    self.pictures.first || Picture.default_picture
  end

  def add_picture(picture)
    self.pictures << picture unless self.pictures.include?(picture)
  end

  # fetch last activities
  def activities(limit, skip = 0)
    Activr.activities(limit, :skip => skip, :album => self._id)
  end

end
