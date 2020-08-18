class UsersController < ApplicationController
    before_action :user_find, only: [:show, :edit, :update]
    def new
        @user = User.new
    end
    def edit;end
    def show;end  
    def create
        user = User.create(user_params)
        redirect_to user_path(user)
    end
    def update
        @user.update(user_params)
        redirect_to user_path(@user)
    end 
private
    def user_params
        params.require(:user).permit(:name, :bio, :birthday, :post_count, :life_spent_on_anime)
    end
    def user_find
      @user =  User.find(params[:id])
    end
end
