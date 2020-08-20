class User < ApplicationRecord
    # has_many :trackeds
    # has_many :tracked_animes, through: :trackeds, source: :animes
    has_many :reviews
    has_many :animes, through: :reviews
    has_secure_password
end
