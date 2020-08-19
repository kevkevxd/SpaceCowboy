class ChangeStartDateToBeDateInAnimes < ActiveRecord::Migration[6.0]
  def change
    change_column :animes, :start_date, :date
  end
end
