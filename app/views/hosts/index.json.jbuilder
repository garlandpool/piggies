json.array!(@hosts) do |host|
  json.extract! host, :id, :first, :last, :street, :city, :state, :zipcode, :h_phone, :c_phone, :visible, :artist_id
  json.url host_url(host, format: :json)
end
