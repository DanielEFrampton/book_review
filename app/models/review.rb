class Review
  attr_reader :summary, :pub_date
  def initialize(review_data)
    @summary = review_data[:summary]
    @pub_date = review_data[:pub_date]
  end
end
