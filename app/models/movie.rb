class Movie < ApplicationRecord
  has_one_attached :avatar, dependent: :destroy
end
