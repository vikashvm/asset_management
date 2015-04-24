json.array!(@inventories) do |inventory|
  json.extract! inventory, :id, :serial_no, :status, :date, :xid, :prod
  json.url inventory_url(inventory, format: :json)
end
