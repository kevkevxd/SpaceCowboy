class ChangeEndDateToBeDateInAnimes < ActiveRecord::Migration[6.0]
  def change
    change_column :animes, :end_date, :date
  end
end
