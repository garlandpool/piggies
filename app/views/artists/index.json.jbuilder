json.array!(@artists) do |artist|
  json.extract! artist, :id, :first, :last, :title, :email, :address, :city, :state, :zipcode, :bday, :bmonth, :byear, :homephone, :cellphone, :officephone, :zipareas, :contract_day, :contract_month, :contract_year
  json.url artist_url(artist, format: :json)
end
