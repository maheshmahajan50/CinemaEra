FactoryBot.define do
  factory :review do
    description { "Nice Movie" }
    email { "test@example.com" }
    rating { 4 }
    movie
  end
end
