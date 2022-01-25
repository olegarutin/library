class Author < ApplicationRecord
  has_secure_password
  has_one_attached :profile_image

  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :email, uniqueness: true
  validates :first_name, :last_name, presence: true
  after_commit :add_default_avatar, only: %i[update create show]

  def full_name
    "#{first_name} #{last_name}"
  end

  def add_default_avatar
    unless profile_image.attached?
      profile_image.attach(
        io: File.open(
          Rails.root.join(
            'app', 'assets', 'images', 'default_profile.png'
          )
        ),
        filename: 'default_profile.png',
        content_type: 'image/png'
      )
    end
  end
end
