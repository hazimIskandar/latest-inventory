class CreateExpenseTransactions < ActiveRecord::Migration
  def change
    create_table :expense_transactions do |t|
      t.date :e_date
      t.decimal :e_total_price
      t.text :e_note
      t.references :expense, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
