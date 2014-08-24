json.array!(@clubs) do |club|
  json.extract! club, :id, :name, :address
  json.url club_url(club, format: :json)
end
