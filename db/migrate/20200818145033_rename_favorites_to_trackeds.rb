class RenameFavoritesToTrackeds < ActiveRecord::Migration[6.0]
  def change
    rename_table :favorites, :trackeds
  end
end
