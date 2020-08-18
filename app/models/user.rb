class User < ApplicationRecord
    has_many :trackeds
    has_many :animes, through: :trackeds
end
