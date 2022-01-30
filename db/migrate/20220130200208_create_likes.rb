class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :author, null: false, foreign_key: true
      t.references :comment, null: false, foreign_key: true
      t.integer :vote_type

      t.timestamps
    end

    add_index :likes, %i[author_id comment_id], unique: true
  end
end
