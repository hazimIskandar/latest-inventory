json.array!(@expenses) do |expense|
  json.extract! expense, :id, :e_category, :user_id
  json.url expense_url(expense, format: :json)
end
