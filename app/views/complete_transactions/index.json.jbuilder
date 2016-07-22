json.array!(@complete_transactions) do |complete_transaction|
  json.extract! complete_transaction, :id, :f_date, :f_type, :f_quantity, :f_total_sell, :f_unit_sell, :f_buyer, :complete_id
  json.url complete_transaction_url(complete_transaction, format: :json)
end
