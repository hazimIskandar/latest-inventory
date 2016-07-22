class CreateCompleteTransactions < ActiveRecord::Migration
  def change
    create_table :complete_transactions do |t|
      t.date :f_date
      t.string :f_type
      t.integer :f_quantity
      t.decimal :f_total_sell
      t.decimal :f_unit_sell
      t.string :f_buyer
      t.references :complete, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
