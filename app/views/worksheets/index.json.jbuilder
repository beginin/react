json.array!(@worksheets) do |worksheet|
  json.extract! worksheet, :sex, :age, :language_id, :specialty_id, :dateinput, :city_id
  json.url worksheet_url(worksheet, format: :json)
end
