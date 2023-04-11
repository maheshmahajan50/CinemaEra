require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  describe "GET #index" do
    it "returns a successful response" do
      get :index
      expect(response).to be_successful
    end

    it "assigns @movies" do
      get :index
      expect(assigns(:movies)).not_to be_nil
    end
  end

  describe "GET #show" do
    let!(:movie) { create(:movie) }

    it "returns a successful response" do
      get :show, params: { id: movie.id }
      expect(response).to be_successful
    end

    it "assigns @movie" do
      get :show, params: { id: movie.id }
      expect(assigns(:movie)).to eq(movie)
    end

    it "assigns @rating" do
      review1 = create(:review, rating: 3, movie: movie)
      review2 = create(:review, rating: 5, movie: movie)
      get :show, params: { id: movie.id }
      expect(assigns(:rating)).to eq(4)
    end

    it "assigns @reviews" do
      review1 = create(:review, movie: movie)
      review2 = create(:review, movie: movie)
      get :show, params: { id: movie.id }
      expect(assigns(:reviews)).to match_array([review1, review2])
    end
  end

  describe "GET #favorite" do
    let!(:movie1) { create(:movie, title: "Avatar") }
    let!(:movie2) { create(:movie, title: "The Matrix") }

    it "returns a successful response" do
      get :favorite
      expect(response).to be_successful
    end

    context "when q parameter is present" do
      it "assigns @favorite_movies that match the search query" do
        get :favorite, params: { q: "Avatar" }
        expect(assigns(:favorite_movies)).to match_array([movie1])
      end
    end

    context "when q parameter is not present" do
      it "assigns all the movies to @favorite_movies" do
        get :favorite
        expect(assigns(:favorite_movies)).to match_array([movie1, movie2])
      end
    end
  end

  describe "POST #create" do
    let(:valid_params) do
      {
        title: "Titanic",
        released_year: 1997,
        reference_id: "tt0120338"
      }
    end

    let(:invalid_params) do
      {
        title: "",
        released_year: 1997,
        reference_id: "tt0120338"
      }
    end

    it "creates a new movie with valid params" do
      expect {
        post :create, params: valid_params
      }.to change(Movie, :count).by(1)
    end

    it "does not create a new movie with invalid params" do
      expect {
        post :create, params: invalid_params
      }.not_to change(Movie, :count)
    end
  end
end
