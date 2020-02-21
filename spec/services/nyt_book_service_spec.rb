require 'rails_helper'

describe NytBookService, :vcr do
  describe 'methods' do
    describe 'book_reviews' do
      it 'should return reviews for given title with summary and publication date' do
        data = NytBookService.new.book_reviews('normal people')

        first_review = {
          summary: 'Rooney’s second novel tracks two gifted but troubled teenagers across four years of friendship and occasional romance.',
          pub_date: '2019-04-08'
        }
        second_review = {
          summary: "Like “Conversations With Friends,” “Normal People” also traces a young romance in Ireland.",
          pub_date: "2019-04-15"
        }

        expect(data[0]).to eq(first_review)
        expect(data[1]).to eq(second_review)
      end
    end
  end
end
