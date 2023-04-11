class MoviesController < ApplicationController
  DEFAULT_TITLE = 'AVATAR'.freeze

  def index
    query = params[:q] || DEFAULT_TITLE
    cache_key = "movies_#{query}"
    @movies = Rails.cache.fetch(cache_key, expires_in: 10.minute) do
      RapidApiService.new.find_by_title(query)
    end
  end

  def show
    @movie = Movie.includes(:reviews).find(params[:id])
    @rating = @movie.reviews.average(:rating).to_i
    @reviews = @movie.reviews
  end

  def favorite
    @favorite_movies = params[:q] ? Movie.search_by_title(params[:q]) : Movie.all
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.avatar_url = params[:image_url] if params[:image_url]
    if @movie.save
      flash[:success] = "Movie added to your favorite list."
      redirect_to your_favorite_path
    else
      flash[:danger] = "Something went wrong."
    end
  end

  private

  def movie_params
    params.permit(:title, :released_year, :reference_id)
  end
end
