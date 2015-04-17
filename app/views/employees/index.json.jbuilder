json.array!(@employees) do |employee|
  json.extract! employee, :id, :name, :email, :xid, :phone
  json.url employee_url(employee, format: :json)
end
