module MoviesHelper
  def image_url(movie)
    if movie.is_a?(ActiveRecord::Base)

    else
      movie.dig('image', 'url') || no_image_url
    end
  end

  def get_reference_id(movie)
    movie["id"].split("/")[2]
  end

  def no_image_url
    'https://via.placeholder.com/450x300'
  end
end
