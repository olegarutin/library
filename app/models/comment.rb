class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :post
  belongs_to :author

  has_many :comment_votes, dependent: :destroy

  enum status: %i[published unpublished]

  scope :published, -> { where(status: 'published') }
  scope :unpublished, -> { where(status: 'unpublished') }

  def editable?(current_user)
    return if current_user.nil?
    self.author_id == current_user.id
  end
end
