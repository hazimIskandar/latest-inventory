class AddDateToProfits < ActiveRecord::Migration
  def change
    add_column :profits, :r_date, :date
    add_column :profits, :r_profit, :decimal
  end
end
