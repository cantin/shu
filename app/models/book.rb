class Book < ActiveRecord::Base
  belongs_to :user
  has_many :commets

  validates :name, presence: true
  validates :author, presence: true

  mount_uploader :cover, CoverUploader
  mount_uploader :content, ContentUploader

  acts_as_followable
end
