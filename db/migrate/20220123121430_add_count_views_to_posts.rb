class AddCountViewsToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :count_views, :integer
  end
end
