json.array!(@steps) do |step|
  json.extract! step, :id, :name, :guide_id, :timer, :line_number, :layout_type_id
  json.url step_url(step, format: :json)
end
