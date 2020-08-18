class Anime < ApplicationRecord
    has_many :trackeds
    has_many :user_reviews, through: :trackeds, source: :users
    has_many :reviews
    has_many :user_reviews, through: :reviews, source: :users
end
