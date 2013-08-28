json.array!(@stimuls) do |stimul|
  json.extract! stimul, :stimul
  json.url stimul_url(stimul, format: :json)
end
