class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author

  enum status: %i[published unpublished]
end
