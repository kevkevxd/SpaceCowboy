class CreateAnimes < ActiveRecord::Migration[6.0]
  def change
    create_table :animes do |t|
      t.string :title
      t.datetime :start_date
      t.datetime :end_date
      t.integer :average_rating
      t.string :poster_image
      t.text :synopsis
      t.timestamps
    end
  end
end
