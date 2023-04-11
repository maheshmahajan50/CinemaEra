class ReviewsController < ApplicationController
  def create
    @review = Review.new(review_params)
    if @review.save
      flash[:success] = "Review added to moive."
      redirect_to movie_path(review_params[:movie_id])
    else
      flash[:danger] = @review.errors.full_messages.join(" ")
      redirect_to movie_path(review_params[:movie_id])
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :description, :movie_id, :email)
  end
end
