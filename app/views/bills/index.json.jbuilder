json.array!(@bills) do |bill|
  json.extract! bill, :id, :name, :category_id, :price, :comment
  json.url bill_url(bill, format: :json)
end
