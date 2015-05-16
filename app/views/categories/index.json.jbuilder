json.array!(@categories) do |category|
  json.extract! category, :id, :name, :weight
  json.url category_url(category, format: :json)
end
