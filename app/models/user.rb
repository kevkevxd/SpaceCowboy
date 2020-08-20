class User < ApplicationRecord
    # has_many :trackeds
    # has_many :tracked_animes, through: :trackeds, source: :user
    has_many :reviews
    has_many :animes, through: :reviews
    # validates :user, uniqueness: :true
    has_secure_password



end
