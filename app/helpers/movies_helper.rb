module MoviesHelper
  def image_url(movie)
    movie.dig('image', 'url') || no_image_url
  end

  def no_image_url
    'https://via.placeholder.com/450x300'
  end
end
