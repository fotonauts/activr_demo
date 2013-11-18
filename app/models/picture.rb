class Picture

  include Mongoid::Document

  attr_accessible :title, :fake, :owner


  field :title, :type => String
  field :fake, :type => Boolean, :default => false

  belongs_to :owner, :class_name => "User", :foreign_key => :owner_id
  has_and_belongs_to_many :albums

  validates_presence_of :title

end
