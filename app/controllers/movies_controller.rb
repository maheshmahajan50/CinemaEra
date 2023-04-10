class MoviesController < ApplicationController
  DEFAULT_TITLE = 'AVATAR'

  def index
    query = params[:q] || DEFAULT_TITLE
    @movies = RapidApiService.new.find_by_title(query)
  end
end
