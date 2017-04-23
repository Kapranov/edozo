class Comment < ApplicationRecord
  # belongs_to :photo
  belongs_to :commentable, polymorphic: true
end
