require 'rails_helper'

describe Review do
  before(:each) do
    data = {
      summary: 'Rooney’s second novel tracks two gifted but troubled teenagers across four years of friendship and occasional romance.',
      pub_date: '2019-04-08'
    }
    @review = Review.new(data)
  end

  it 'can initialize with data' do
    expect(@review).to be_instance_of(Review)
    expect(@review.summary).to eq(data[:summary])
    expect(@review.pub_date).to eq(data[:pub_date])
  end

  it 'has a number' do
    expect(@review.number).to eq(1)
  end
end
