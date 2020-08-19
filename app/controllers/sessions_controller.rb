class SessionsController < ApplicationController


  def logout
    session.delete(:user_id)

    redirect_to animes_path
  end




end
