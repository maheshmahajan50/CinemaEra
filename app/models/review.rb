class Review < ApplicationRecord
  belongs_to :movie
  validates :email, :description, :rating, presence: true
end
