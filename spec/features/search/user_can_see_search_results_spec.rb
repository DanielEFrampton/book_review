require 'rails_helper'

describe 'As a user', :vcr do
  describe 'When I visit "/"' do
    before(:each) do
      visit '/'
    end

    describe 'And I input "the man who saw everything" into the form' do
      before(:each) do
        fill_in "Enter Book Title", with: "the man who saw everything"
      end

      describe 'And I click "Find Book"' do
        before(:each) do
          click_on "Find Book"
        end

        it 'Then I should be on page "/search"' do
          expect(current_path).to eq('/search')
        end

        it "Then I should see the book's title, author, and genres" do
          # (Note: genres is referred to as "subjects" in the book search response)

          expect(page).to have_content("Title: The Man Who Saw Everything")
          expect(page).to have_content("Author: Deborah Levy")
          expect(page).to have_content("Genres: _______") # fill in after testing API
        end

        it 'I should also see all reviews from NYT for book' do
          # (Note: reviews are the "summary" in the book review response)

          within '.reviews' do
            within '#review-1' do
              expect(page).to have_content('Review 1: ""The Man Who Saw Everything," which was longlisted for the Booker Prize, looks at masculinity through the perspective of a young historian who sneers at "authoritarian old men.""')
              expect(page).to have_content('Review Publication Date: 2019-10-09')
            end

            within '#review-2' do
              expect(page).to have_content('Review 2: "Deborah Levy\'s latest novel, "The Man Who Saw Everything," experiments with time travel, history and the endless complications of love."')
              expect(page).to have_content('Review Publication Date: 2019-10-15')
            end
          end
        end
      end
    end
  end
end
