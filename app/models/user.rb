class User

  include Activr::Entity::ModelMixin

  activr_entity :feed_index => true

  include Mongoid::Document

  field :_id, :type => String, :default => lambda { first_name ? first_name.parameterize : nil }

  # carrierwave
  mount_uploader :avatar, AvatarUploader

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

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

  # fields
  field :first_name, :type => String
  field :last_name, :type => String
  field :fake, :type => Boolean, :default => false

  # validation
  validates_presence_of :first_name, :last_name
  validates_uniqueness_of :email, :case_sensitive => false

  # relationships
  has_and_belongs_to_many :following, :class_name => 'User', :inverse_of => :followers #, :autosave => true
  has_and_belongs_to_many :followers, :class_name => 'User', :inverse_of => :following

  has_and_belongs_to_many :following_albums, :class_name => 'Album', :inverse_of => :followers
  has_and_belongs_to_many :likes, :class_name => "Picture", :inverse_of => :likers

  has_many :albums, :class_name => 'Album', :inverse_of => :owner
  has_many :pictures, :class_name => 'Picture', :inverse_of => :owner


  def fullname
    "#{self.first_name} #{self.last_name}"
  end

  # albums in which we can add given picture
  def target_albums(picture)
    self.albums.reject{ |album| album.pictures.include?(picture) }
  end


  #
  # Relationships
  #

  def follow!(user)
    if self.id != user.id && !self.following.include?(user)
      self.following << user

      # dispatch activity
      Activr.dispatch!(FollowBuddyActivity.new(:actor => self, :buddy => user))
    end
  end

  def unfollow!(user)
    self.following.delete(user)
  end

  def follow?(user)
    self.following.include?(user)
  end

  def follow_album!(album)
    if !self.following_albums.include?(album)
      self.following_albums << album

      # dispatch activity
      Activr.dispatch!(FollowAlbumActivity.new(:actor => self, :album => album))
    end
  end

  def unfollow_album!(album)
    self.following_albums.delete(album)
  end

  def follow_album?(user)
    self.following_albums.include?(user)
  end

  def like!(picture)
    if !self.likes.include?(picture)
      self.likes << picture

      # dispatch activity
      Activr.dispatch!(LikePictureActivity.new(:actor => self, :picture => picture))
    end
  end

  def unlike!(picture)
    self.likes.delete(picture)
  end

  def like?(picture)
    self.likes.include?(picture)
  end

end
