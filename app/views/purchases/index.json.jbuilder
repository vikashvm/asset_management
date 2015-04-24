json.array!(@purchases) do |purchase|
  json.extract! purchase, :id, :prod, :quantity, :cost, :purchase_date, :expiry_date, :vendor, :serial_no
  json.url purchase_url(purchase, format: :json)
end
