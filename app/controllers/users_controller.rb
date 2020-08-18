class UsersController < ApplicationController
    def new
        @user = User.new
    end

    def create
        user = User.create(user_params)
    end

    def show
    
    end
private
    def user_params
        params.require(:user).permit(:name, :bio, :birthday, :post_count, :life_spent_on_anime)
    end

end
