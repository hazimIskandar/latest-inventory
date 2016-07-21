json.array!(@raw_transactions) do |raw_transaction|
  json.extract! raw_transaction, :id, :t_date, :t_type, :t_quantity, :t_total_price, :t_price_unit, :t_supplier, :material_id
  json.url raw_transaction_url(raw_transaction, format: :json)
end
