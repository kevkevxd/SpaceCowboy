class Review < ApplicationRecord
    belongs_to :anime
    belongs_to :user
    validates :rating, length: { in: 1..10 }
    validates :comment, presence: :true
end
