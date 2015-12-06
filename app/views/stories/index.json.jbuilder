json.array!(@stories) do |story|
  json.extract! story, :id, :intro, :body, :signature, :status, :company
  json.url story_url(story, format: :json)
end
