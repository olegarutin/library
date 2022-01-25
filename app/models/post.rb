class Post < ApplicationRecord
  has_one_attached :image

  INVALIDED_IMAGE_ERROR = 'must be a URL for GIF, JPG or PNG image.'.freeze

  belongs_to :author
  has_many :comments, dependent: :destroy

  validates :title, length: { in: 1..40 }
  validates :image, presence: true
  validates :content, presence: true
end
