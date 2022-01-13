class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :status, default: 1
      t.references :post
      t.references :author

      t.timestamps
    end
  end
end
