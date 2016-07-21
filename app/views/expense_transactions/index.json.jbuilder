json.array!(@expense_transactions) do |expense_transaction|
  json.extract! expense_transaction, :id, :e_date, :e_total_price, :e_note, :expense_id
  json.url expense_transaction_url(expense_transaction, format: :json)
end
