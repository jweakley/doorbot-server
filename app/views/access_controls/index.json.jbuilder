json.array!(@access_controls) do |access_control|
  json.extract! access_control, :id, :doorbot_id, :credential_id
  json.url access_control_url(access_control, format: :json)
end
