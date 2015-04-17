json.array!(@products) do |product|
  json.extract! product, :id, :brand, :equipment, :model, :capacity
  json.url product_url(product, format: :json)
end
