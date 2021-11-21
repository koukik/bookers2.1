class PostImage < ApplicationRecord
  delongs_to :user
  attachment :image
end
