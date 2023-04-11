class MoviesController < ApplicationController
  DEFAULT_TITLE = 'AVATAR'

  def index
    query = params[:q] || DEFAULT_TITLE
    @movies = RapidApiService.new.find_by_title(query)
  end

  def show
    @movie = Movie.find(params[:id])
    @rating = @movie.reviews.average(:rating).to_i
    @reviews = @movie.reviews
  end

  def favorite
    if params[:q]
      @favorite_movies = Movie.where("title LIKE ?", "%#{params[:q]}%")
    else
      @favorite_movies = Movie.all
    end
  end

  def create
    @movie = Movie.new(movie_params)
    @movie.avatar_url = params[:image_url]
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
