class Post < ApplicationRecord
  belongs_to :author
  has_many :comments, dependent: :destroy
  validates :title, length: { in: 1..40 }
  validates :image, allow_blank: true, format: { with: %r{.(gif|jpg|png)\Z}i, message: 'must be a URL for GIF, JPG or PNG image.' }
  validates :content, presence: true
end
