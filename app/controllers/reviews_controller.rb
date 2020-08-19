class ReviewsController < ApplicationController
    before_action :find_reviews, only: [:edit, :update, :destroy]
    def new
        @review = Review.new
        # @users = User.all 
        # @animes = Anime.all
    end
    def create 
        @review = @current_user.reviews.create(review_params)
        @review.save
        redirect_to user_path(@review.user_id) 
    end
    
    def edit;end
    
    def update
        @review.update(review_params)
        redirect_to review_path(@review)
    end

    def destroy
        # find_reviews
    end
private
    def find_reviews
        @review = Review.find(params[:id])
    end

    def review_params
        params.require(:review).permit(:user_id, :anime_id, :rating, :comment, :comment_likes)
    end 
end
