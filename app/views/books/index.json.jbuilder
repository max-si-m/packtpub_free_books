json.array!(@books) do |book|
  json.extract! book, :id, :title, :image, :description, :views, :downloads
  json.url book_url(book, format: :json)
end
