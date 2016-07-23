class CreateProfits < ActiveRecord::Migration
  def change
    create_table :profits do |t|
      t.date :p_date
      t.decimal :p_profit
      t.references :raw_transaction, index: true, foreign_key: true
      t.references :complete_transaction, index: true, foreign_key: true
      t.references :expense_transaction, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
