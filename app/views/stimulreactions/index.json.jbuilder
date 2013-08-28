json.array!(@stimulreactions) do |stimulreaction|
  json.extract! stimulreaction, :worksheet_id, :reaction_id, :stimul_id
  json.url stimulreaction_url(stimulreaction, format: :json)
end
