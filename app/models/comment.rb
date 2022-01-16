class Comment < ApplicationRecord
  validates_presence_of :body, message: "can't be empty"

  belongs_to :post
  belongs_to :author

  enum status: %i[published unpublished]

  scope :published, -> { where(status: 'published') }
end
