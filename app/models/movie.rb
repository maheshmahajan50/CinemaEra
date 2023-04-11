require 'open-uri'

class Movie < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :title, :released_year, :reference_id, presence: true

  scope :search_by_title, ->(query) { where("lower(title) LIKE ?", "%#{query.downcase}%") }

  def avatar_url=(url)
    file = open(url)
    self.avatar.attach(io: file, filename: "#{self.reference_id}.jpg", content_type: file.content_type_parse.first)
  end
end
