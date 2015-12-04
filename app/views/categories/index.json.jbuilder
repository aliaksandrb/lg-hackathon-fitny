json.array!(@categories) do |category|
  json.extract! category, :id, :name, :parent_id, :lft, :rgt, :depth, :children_count
  json.url category_url(category, format: :json)
end
