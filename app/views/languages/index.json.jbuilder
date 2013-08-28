json.array!(@languages) do |language|
  json.extract! language, :language
  json.url language_url(language, format: :json)
end
