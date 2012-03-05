class Commet < ActiveRecord::Base
  belongs_to :user
  belongs_to :book

  validates :commet, presence: true
end
