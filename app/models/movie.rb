require 'open-uri'

class Movie < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy

  def avatar_url=(url)
    file = open(url)
    self.avatar.attach(io: file, filename: "#{self.reference_id}.jpg", content_type: file.content_type_parse.first)
  end
end
