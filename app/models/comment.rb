class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author

  enum status: [:published, :unpublished]
end
