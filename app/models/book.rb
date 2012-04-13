class Book < ActiveRecord::Base
  belongs_to :user
  acts_as_commentable

  validates :name, presence: true
  validates :author, presence: true

  mount_uploader :cover, CoverUploader
  mount_uploader :content, ContentUploader

  acts_as_followable
  acts_as_taggable

  class << self
    def most_commented_books amount
      Book.joins(:comments).group('books.id').order('count(comments.commentable_id) desc').limit(amount)
    end
  end
end
