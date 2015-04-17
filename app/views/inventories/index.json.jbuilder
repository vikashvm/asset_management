json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :serial_no, :product_id, :serial_no
  json.url inventory_url(inventory, format: :json)
end
