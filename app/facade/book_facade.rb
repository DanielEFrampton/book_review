class BookFacade
  attr_reader :title, :author, :genres
  def initialize(title)
    data = OpenLibraryService.new.book_data(title)
    @title = data[:title]
    @author = data[:author]
    @genres = data[:genres]
    @reviews = NytBookService.new.book_reviews(title)
  end
end
