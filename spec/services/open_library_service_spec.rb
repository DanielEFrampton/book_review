require 'rails_helper'

describe OpenLibraryService do
  describe 'methods' do
    describe 'book_data' do
      it 'should return title, author, and genres for given title' do
        data = OpenLibraryService.new.book_data('the man who saw everything')

        expect(data['author']).to eq('Deborah Levy')
        expect(data['subject']).to eq([])
        expect(data['title']).to eq("The Man Who Saw Everything")

        data_2 = OpenLibraryService.new.book_data('normal people')
        expect(data_2['author']).to eq('Sally Rooney')
        expect(data_2['subject']).to eq([])
        expect(data_2['title']).to eq("Normal People")
      end
    end
  end
end
