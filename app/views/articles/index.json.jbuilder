json.array!(@articles) do |article|
  json.extract! article, :id, :title, :content, :author, :approved
  json.url article_url(article, format: :json)
end
