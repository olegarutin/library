class Author < ApplicationRecord
  has_secure_password
  has_one_attached :profile_image

  EMAIL_ERROR_MESSAGE = 'You  have entered an invalid e-mail address. Please try again.'.freeze
  PASSWORD_ERROR_MESSAGE = 'Password has eight characters or longer. And it must contain 1 lowercase character,
    1 uppercase character, 1 number, and at least one special character in this set (!@#$%^&*).'.freeze

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comment_votes, dependent: :destroy

  validates :password, presence: true, format: { with: /(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}/i, message: PASSWORD_ERROR_MESSAGE }, allow_nil: true
  validates :email, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, message: EMAIL_ERROR_MESSAGE }
  validates :first_name, :last_name, presence: true

  after_commit :add_default_avatar, only: %i[update create show]

  def full_name
    "#{first_name} #{last_name}"
  end

  def add_default_avatar
    return if profile_image.attached?

    profile_image.attach(
      io: File.open(
        Rails.root.join(
          'app', 'javascript', 'images', 'default_profile.png'
        )
      ),
      filename: 'default_profile.png',
      content_type: 'image/png'
    )
  end
end
