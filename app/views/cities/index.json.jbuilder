json.array!(@cities) do |city|
  json.extract! city, :city
  json.url city_url(city, format: :json)
end
