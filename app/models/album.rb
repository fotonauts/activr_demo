class Album

  include Mongoid::Document

  attr_accessible :name, :fake, :owner, :pictures, :followers

  field :name, :type => String
  field :fake, :type => Boolean, :default => false

  belongs_to :owner, :class_name => "User", :inverse_of => :albums
  has_and_belongs_to_many :pictures, :class_name => "Picture", :inverse_of => :albums
  has_and_belongs_to_many :followers, :class_name => "User", :inverse_of => :following_albums

  validates_presence_of :name

end
