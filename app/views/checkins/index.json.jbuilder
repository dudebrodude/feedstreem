json.array!(@checkins) do |checkin|
  json.extract! checkin, :id, :name, :users_id, :clubs_id
  json.url checkin_url(checkin, format: :json)
end
