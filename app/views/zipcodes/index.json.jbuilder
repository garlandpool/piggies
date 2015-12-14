json.array!(@zipcodes) do |zipcode|
  json.extract! zipcode, :id, :zip, :artist_id, :visible
  json.url zipcode_url(zipcode, format: :json)
end
