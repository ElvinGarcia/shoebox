class SessionsController < ApplicationController

  def login
      @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      login_in(@user)
      redirect_to @user
    else
      flash[:alert]= "Wrong User Name or/and Password"
      redirect_to login_path                                                                                                                          
    end
  end

  private

  def auth
    request.env['omniauth.auth']
  end

  
end
