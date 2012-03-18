class Book < ActiveRecord::Base
  belongs_to :user
  acts_as_commentable

  validates :name, presence: true
  validates :author, presence: true

  mount_uploader :cover, CoverUploader
  mount_uploader :content, ContentUploader

  acts_as_followable

  class << self
    def most_commented_books amount
      Book.includes(:comments).group(id)
    end
  end
end
