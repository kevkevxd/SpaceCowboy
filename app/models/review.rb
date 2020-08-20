class Review < ApplicationRecord
    belongs_to :anime
    belongs_to :user
    validates :rating, length: { in: 1..10 }
    validates :comment, presence: :true
    validates_uniqueness_of :anime_id, scope: :user_id, :message => "already has a review from you."
end
