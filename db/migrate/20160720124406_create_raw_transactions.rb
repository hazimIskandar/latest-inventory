class CreateRawTransactions < ActiveRecord::Migration
  def change
    create_table :raw_transactions do |t|
      t.date :t_date
      t.string :t_type
      t.integer :t_quantity
      t.decimal :t_total_price
      t.decimal :t_price_unit
      t.string :t_supplier
      t.references :material, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
