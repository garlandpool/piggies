json.array!(@hows) do |how|
  json.extract! how, :id, :symbol, :title, :body
  json.url how_url(how, format: :json)
end
