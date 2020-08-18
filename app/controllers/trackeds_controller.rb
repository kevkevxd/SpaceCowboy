class TrackedsController < ApplicationController
    before_action :find_tracked, only: [:edit, :update, :destroy]
   
    def new
        @tracked = Tracked.new
    end

    def edit;end

    def create 
        tracked = Tracked.create(tracked_params)   
            redirect_to @tracked 
        else
            render 'new'
        end
    end

    def update
        @tracked.update(tracked_params)
        redirect_to tracked_path(@tracked)
    end

    def destroy
        # find_tracked
    end
private
    def find_tracked
        @tracked = Tracked.find(params[:id])
    end

    def tracked_params
        params.require(:tracked).permit(:user_id, :anime_id, :rating)
    end

end
