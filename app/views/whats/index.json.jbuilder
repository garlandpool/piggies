json.array!(@whats) do |what|
  json.extract! what, :id, :font_awesome, :title, :body
  json.url what_url(what, format: :json)
end
