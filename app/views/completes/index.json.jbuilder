json.array!(@completes) do |complete|
  json.extract! complete, :id, :name, :unit, :minimum_stock, :current_stock, :user_id
  json.url complete_url(complete, format: :json)
end
