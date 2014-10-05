json.array!(@doorbots) do |doorbot|
  json.extract! doorbot, :id, :nickname, :api_key
  json.url doorbot_url(doorbot, format: :json)
end
