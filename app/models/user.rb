class User < ApplicationRecord
    has_many :trackeds
    has_many :tracked_animes, through: :trackeds, source: :animes
    has_many :reviews
    has_many :reviewed_animes, through: :reviews, source: :animes
end
