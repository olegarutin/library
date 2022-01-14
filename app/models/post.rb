class Post < ApplicationRecord
  INVALIDED_IMAGE_ERROR = 'must be a URL for GIF, JPG or PNG image.'.freeze

  belongs_to :author
  has_many :comments, dependent: :destroy

  validates :title, length: { in: 1..40 }
  validates :image, allow_blank: true, format: { with: %r{.(gif|jpg|png)\Z}i, message: INVALIDED_IMAGE_ERROR }
  validates :content, presence: true
end
