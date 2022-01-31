class Like < ApplicationRecord
  belongs_to :author
  belongs_to :comment

  enum vote_type: %i[likes dislikes]
end
