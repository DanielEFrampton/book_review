require 'rails_helper'

describe BookFacade, :vcr do
  before do
    @book_facade = BookFacade.new("normal people")
  end

  it 'can initialize with title' do
    expect(@book_facade).to be_instance_of(BookFacade)
  end

  it 'has title, author, genres, and reviews' do
    expect(@book_facade.title).to eq("Normal People")
    expect(@book_facade.author).to eq("Sally Rooney")
    expect(@book_facade.genres).to eq([])
    expect(@book_facade.reviews.first).to be_instance_of(Review)
    expect(@book_facade.reviews.last).to be_instance_of(Review)
    expect(@book_facade.reviews.length).to eq(2)
    expect(@book_facade.reviews).to be_instance_of(Array)
  end
end
