require 'rails_helper'

RSpec.describe RapidApiService do
  let(:rapid_api_service) { RapidApiService.new }

  describe '#find_by_title' do
    context 'with a valid movie title' do
      let(:movie_title) { 'The Dark Knight' }

      it 'returns an array of movie results' do
        results = rapid_api_service.find_by_title(movie_title)

        expect(results).to be_an(Array)
        expect(results).not_to be_empty
        expect(results.first).to include('titleType' => 'movie')
      end
    end

    context 'with an empty movie title' do
      let(:movie_title) { '' }

      it 'raises an error' do
        expect{ rapid_api_service.find_by_title(movie_title) }.to raise_error(RuntimeError, 'Please give any title to find movie.')
      end
    end

    context 'with an invalid movie title' do
      let(:movie_title) { 'Invalid Movie Title' }

      it 'returns an empty array' do
        results = rapid_api_service.find_by_title(movie_title)

        expect(results).to be_an(Array)
        expect(results).to be_empty
      end
    end
  end
end
