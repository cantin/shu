class Topic < ActiveRecord::Base
  acts_as_taggable
  acts_as_commentable

  belongs_to :user

  default_scope order "created_at desc"

  validates :title, presence: true
  validates :content, presence: true
end
