class Book < ActiveRecord::Base
  mount_uploader :cover, CoverUploader
  mount_uploader :content, ContentUploader
end
