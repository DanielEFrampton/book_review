class BookFacade
  attr_reader :title, :author
  def initialize(title)
    @title = title
    data = OpenLibraryService.new.book_data(@title)
    @author = data['author']
    @genres = data['subjects']
    @reviews = NytService.new.book_reviews(@title)
  end
end
