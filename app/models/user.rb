class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :name

  has_many :books
  has_many :comments

  mount_uploader :avatar, AvatarUploader

  acts_as_follower
  acts_as_followable
  acts_as_taggable_on :interests

  class << self
    def most_active_users amount
      User.joins(:books).group('users.id').order('count(books.user_id) desc').limit(amount)
    end
  end
end
