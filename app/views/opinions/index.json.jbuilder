json.array!(@opinions) do |opinion|
  json.extract! opinion, :nickname, :about, :tag
  json.url opinion_url(opinion, format: :json)
end
