json.array!(@users) do |user|
  json.extract! user, :nickname, :name, :soname, :lastname, :bday, :hobby
  json.url user_url(user, format: :json)
end
