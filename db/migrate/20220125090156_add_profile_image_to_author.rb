class AddProfileImageToAuthor < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :profile_image, :string
  end
end
