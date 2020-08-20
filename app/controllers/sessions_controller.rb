class SessionsController < ApplicationController

  def logout
    session.delete(:user_id)

    redirect_to animes_path
  end

  def new
  end

  def destroy
  end
  end

  def create
    render 'new'

    @user = User.find_by(name: params[:session][:name])
    if @user&& user.authenticate(params[:session][:password])
      session[:user_id] = @user.id
      redirect_to user
    else
      flash[:errors] = "Username or Password is Incorrect"
      redirect_to new_login_path
    end
  end

  def logout
    session.delete(:user_id)

    redirect_to new_user_path
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