class Anime < ApplicationRecord
    has_many :trackeds
    has_many :users, through: :trackeds


    has_many :reviews
    has_many :animes, through: :reviews, source: :trackeds
end
