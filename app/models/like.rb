class Like < ApplicationRecord
  belongs_to :author
  belongs_to :comment

  validates :author, uniqueness: { scope: :author }
  validates :comment, uniqueness: { scope: :comment }

  enum vote_type: %i[likes dislikes]
end
