class ReviewsController < ApplicationController
    before_action :find_reviews, only: [:edit, :update, :destroy]
    def new
        @review = Review.new
    end
    def create 
        review = Review.new(review_params)   
        if @review.save 
            redirect_to @review
        else
            render 'new'
        end
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
        params.require(:review).permit(:user_id, :anime_id, :rating)
    end 
end

