class User

  include Mongoid::Document

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :first_name, :last_name, :fake, :email, :password, :password_confirmation, :remember_me

  ## Database authenticatable
  field :email,              :type => String, :default => ""
  field :encrypted_password, :type => String, :default => ""

  ## Recoverable
  field :reset_password_token,   :type => String
  field :reset_password_sent_at, :type => Time

  ## Rememberable
  field :remember_created_at, :type => Time

  ## Trackable
  field :sign_in_count,      :type => Integer, :default => 0
  field :current_sign_in_at, :type => Time
  field :last_sign_in_at,    :type => Time
  field :current_sign_in_ip, :type => String
  field :last_sign_in_ip,    :type => String

  ## Confirmable
  # field :confirmation_token,   :type => String
  # field :confirmed_at,         :type => Time
  # field :confirmation_sent_at, :type => Time
  # field :unconfirmed_email,    :type => String # Only if using reconfirmable

  ## Lockable
  # field :failed_attempts, :type => Integer, :default => 0 # Only if lock strategy is :failed_attempts
  # field :unlock_token,    :type => String # Only if unlock strategy is :email or :both
  # field :locked_at,       :type => Time

  # custom fields
  field :first_name, :type => String
  field :last_name, :type => String
  field :fake, :type => Boolean, :default => false

  # validation
  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email, :case_sensitive => false

  # following / followers
  has_and_belongs_to_many :following, :class_name => 'User', :inverse_of => :followers, :autosave => true
  has_and_belongs_to_many :followers, :class_name => 'User', :inverse_of => :following

  # user's albums and pictures
  has_many :albums, :foreign_key => :owner_id
  has_many :pictures, :foreign_key => :owner_id


  def fullname
    "#{self.first_name} #{self.last_name}"
  end

  def follow!(user)
    if self.id != user.id && !self.following.include?(user)
      self.following << user
    end
  end

  def unfollow!(user)
    self.following.delete(user)
  end

end
