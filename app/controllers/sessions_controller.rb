class SessionsController < ApplicationController

  def logout
    session.delete(:user_id)

    redirect_to animes_path
  end

  def new
  
  end

  def create
  @user = User.create(user_params)
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to user
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to new_user_path
    end
  end

end


# def create 
#   user = User.find_by(name: params[:session][:name])

#   if user && user.authenticate(params[:session][:password])
#     session[:user_id] = user.id 
#     redirect_to user 
#   else 
#     flash[:error] = "username or password is incorrect"
#     redirect_to new_user_path
#   end
# end