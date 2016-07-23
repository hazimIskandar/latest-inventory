class AddTypeToExpenseTransactions < ActiveRecord::Migration
  def change
    add_column :expense_transactions, :e_type, :string
  end
end
