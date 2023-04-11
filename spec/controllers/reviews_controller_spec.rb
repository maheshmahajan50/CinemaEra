require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  describe "#create" do
    let(:movie) { FactoryBot.create(:movie) }
    let(:valid_attributes) { FactoryBot.attributes_for(:review, movie_id: movie.id) }
    let(:invalid_attributes) { FactoryBot.attributes_for(:review, rating: nil, movie_id: movie.id) }

    context "with valid attributes" do
      it "creates a new review" do
        expect {
          post :create, params: { review: valid_attributes }
        }.to change(Review, :count).by(1)
      end

      it "redirects to the movie page" do
        post :create, params: { review: valid_attributes }
        expect(response).to redirect_to(movie_path(movie))
      end

      it "sets a success flash message" do
        post :create, params: { review: valid_attributes }
        expect(flash[:success]).to be_present
      end
    end

    context "with invalid attributes" do
      it "does not create a new review" do
        expect {
          post :create, params: { review: invalid_attributes }
        }.not_to change(Review, :count)
      end

      it "redirects to the movie page" do
        post :create, params: { review: invalid_attributes }
        expect(response).to redirect_to(movie_path(movie))
      end

      it "sets a danger flash message" do
        post :create, params: { review: invalid_attributes }
        expect(flash[:danger]).to be_present
      end
    end
  end
end
