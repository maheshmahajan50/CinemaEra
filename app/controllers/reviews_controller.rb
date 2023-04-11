class ReviewsController < ApplicationController

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:success] = "Review added to moive."
      redirect_to your_favorite_path
    else
      flash[:danger] = "Something went wrong."
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description, :movie_id)
  end
end
