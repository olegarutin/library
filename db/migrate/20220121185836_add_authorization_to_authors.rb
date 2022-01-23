class AddAuthorizationToAuthors < ActiveRecord::Migration[6.1]
  def change
    add_column :authors, :email, :string
    add_column :authors, :password, :string
    add_column :authors, :password_confirmation, :string
    add_column :authors, :password_digest, :string
  end
end
