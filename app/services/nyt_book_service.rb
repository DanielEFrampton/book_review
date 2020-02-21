class NytBookService
  def book_reviews(title)
    data = query(title)
    serialize(data)
  end

  private

  def connection
    Faraday.new('https://api.nytimes.com/svc/books/v3') do |f|
      f.adapter(Faraday.default_adapter)
    end
  end

  def query(title)
    response = connection.get("reviews.json?title=#{title}&api-key=#{ENV['NYTIMES_API_KEY']}")
    body = JSON.parse(response.body)
    body["results"]
  end

  def serialize(data)
    data.map do |review|
      { summary: review['summary'],
        pub_date: review['publication_dt'] }
    end
  end
end
