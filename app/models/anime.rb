class Anime < ApplicationRecord
    has_many :trackeds
    has_many :user_trackeds, through: :trackeds, source: :users
    has_many :reviews
    has_many :user_reviews, through: :reviews, source: :users
    

    # has_many :trackeds
    # has_many :users, through: :trackeds

    # has_many :reviews
    # has_many :users, through: :reviews

    # Anime.user_trackeds
    # Anime.user_reviews
    # User.tracked_animes, user_tracked
    # User.reviewed_animes
end
