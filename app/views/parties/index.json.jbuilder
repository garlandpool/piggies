json.array!(@parties) do |party|
  json.extract! party, :id, :host_id, :date, :duration, :canceled, :user_id
  json.url party_url(party, format: :json)
end
