class SessionsController < ApplicationController

  def login
      @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      log_in(@user)
      redirect_to users_path
    else
      flash[:alert]= "Wrong User Name or/and Password"
      redirect_to login_path                                                                                                                          
    end
  end

  def logout
    log_out
    redirect_to root_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  
end
