class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :anime_id
      t.text :comment
      t.integer :comment_likes
      t.timestamps
    end
  end
end
