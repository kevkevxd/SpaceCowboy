class ChangePostCount < ActiveRecord::Migration[6.0]
  def change
    change_column :users, :post_count, :integer, default: 0
    change_column :users, :life_spent_on_anime, :integer, default: 0
  end
end
