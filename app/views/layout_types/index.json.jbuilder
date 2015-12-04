json.array!(@layout_types) do |layout_type|
  json.extract! layout_type, :id, :name
  json.url layout_type_url(layout_type, format: :json)
end
