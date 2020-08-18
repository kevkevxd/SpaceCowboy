class User < ApplicationRecord
    has_many :trackeds
    has_many :animes, through: :trackeds

     has_many :reviews
     has_many :animes, through: :reviews

    has_secure_password
end
