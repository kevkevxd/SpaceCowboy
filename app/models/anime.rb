class Anime < ApplicationRecord
    has_many :trackeds
    has_many :users, through: :trackeds
end
