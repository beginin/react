json.array!(@reactions) do |reaction|
  json.extract! reaction, :reaction
  json.url reaction_url(reaction, format: :json)
end
