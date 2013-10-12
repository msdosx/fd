json.array!(@facebook_news) do |facebook_news|
  json.extract! facebook_news, :nickname, :about, :tag_id
  json.url facebook_news_url(facebook_news, format: :json)
end
