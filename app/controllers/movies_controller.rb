class MoviesController < ApplicationController
  def index
    @movies = RapidApiService.new.find_by_title("KGF")
  end
end
