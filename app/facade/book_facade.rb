class BookFacade
  attr_reader :title, :author, :genres, :reviews
  def initialize(title)
    data = OpenLibraryService.new.book_data(title)
    @title = data[:title]
    @author = data[:author]
    @genres = data[:genres]
    @reviews = generate_reviews(title)
  end

  def generate_reviews(title)
    review_data = NytBookService.new.book_reviews(title)
    review_data.map do |review|
      Review.new(review)
    end
  end
end
