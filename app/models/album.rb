class Album

  include Mongoid::Document

  attr_accessible :name, :fake, :owner

  field :name, :type => String
  field :fake, :type => Boolean, :default => false

  belongs_to :owner, :class_name => "User", :foreign_key => :owner_id
  has_and_belongs_to_many :pictures

  validates_presence_of :name

end
