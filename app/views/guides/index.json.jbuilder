json.array!(@guides) do |guide|
  json.extract! guide, :id, :name, :category_id_id, :user_id_id
  json.url guide_url(guide, format: :json)
end
