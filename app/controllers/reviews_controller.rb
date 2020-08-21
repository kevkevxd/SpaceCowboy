class ReviewsController < ApplicationController
    before_action :find_reviews, only: [:edit, :update, :destroy]
    def new
        @review = Review.new
    end
    def create 
        @review = @current_user.reviews.build(review_params)
        if @review.save
            redirect_to user_path(@review.user_id)
        else
            flash[:my_error] = @review.errors.full_messages
            redirect_to new_review_path
        end
    end
    
    def edit;end
    
    def update
        if @review.update(review_params)
        redirect_to user_path(@review.user)
    else
        flash[:my_error] = @review.errors.full_messages
        redirect_to edit_review_path
    end
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
