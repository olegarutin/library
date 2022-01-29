class CommentVote < ApplicationRecord
  belongs_to :author
  belongs_to :comment

  validates :author, uniqueness: { scope: :author }
  validates :comment, uniqueness: { scope: :comment }

  enum vote_value: %i[upvote downvote]
end
