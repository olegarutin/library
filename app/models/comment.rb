class Comment < ApplicationRecord
  has_ancestry

  validates :body, presence: true

  belongs_to :post
  belongs_to :author

  has_many :likes, dependent: :destroy

  enum status: %i[published unpublished]

  def editable?(current_user)
    return if current_user.nil?

    self.author_id == current_user.id
  end

  def likes_count
    likes.all.likes.count
  end

  def dislikes_count
    likes.all.dislikes.count
  end

  def allowed?
    Comment.find_by(id: self.root_id).descendant_ids.count < 3
  end
end
