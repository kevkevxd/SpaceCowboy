class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.text :bio
      t.integer :birthday
      t.integer :post_count
      t.integer :life_spent_on_anime
      t.timestamps
    end
  end
end
