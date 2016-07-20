json.array!(@materials) do |material|
  json.extract! material, :id, :name, :unit, :minimum_stock, :current_stock, :user_id
  json.url material_url(material, format: :json)
end
