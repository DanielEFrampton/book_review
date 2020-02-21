class SearchController < ApplicationController
  def index
    @book = BookFacade.new(params[:title])
  end
end
