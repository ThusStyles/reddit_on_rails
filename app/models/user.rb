class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :authentication_keys => [:login]

   validates :username, uniqueness: true, presence: true, format: { with: /^[a-zA-z0-9_-]+$/}, length: { maximum: 25, minimum: 2}

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :image, :login
  attr_accessor :login

  # attr_accessible :title, :body

  has_many :links
  has_many :comments
  has_many :votes
  has_many :subreddits

  mount_uploader :image, ProfileUploader

    def self.find_first_by_auth_conditions(warden_conditions)
      conditions = warden_conditions.dup
      if login = conditions.delete(:login)
        where(conditions).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
      else
        where(conditions).first
      end
    end
end
