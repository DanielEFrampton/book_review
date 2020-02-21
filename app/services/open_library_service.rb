class OpenLibraryService
  def book_data(title)
    data = query(title)
    serialize(data)
  end

  private

  def connection
    Faraday.new('http://openlibrary.org/') do |f|
      f.adapter(Faraday.default_adapter)
    end
  end

  def query(title)
    response = connection.get("/search.json?title=#{title}")
    body = JSON.parse(response.body)
    body["docs"][0]
  end

  def serialize(data)
    { author: data['author_name'].first,
      title: data['title'],
      genres: data['subject'] || [] }
  end
end
