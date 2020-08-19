class ChangeTable < ActiveRecord::Migration[6.0]
  def change
    change_table :users do |t|
      t.date  :birthday
    end
  end
end
