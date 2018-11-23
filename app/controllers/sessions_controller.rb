class SessionsController < ApplicationController

  def login
    if auth
      @user = User.find_by(email: auth[:info][:email].downcase)
        log_in(@user)
        redirect_to user_path(@user), notice: "You are Logged In"       
    else
      @user = User.find_by(email: params[:user][:email].strip.downcase)
      if @user && @user.authenticate(params[:user][:password])
        log_in(@user)
        redirect_to user_path(@user), notice: "You are Logged In"       
      else
        flash[:alert]="The Wrong User Name and/or Password Combination was incorrect"
        redirect_to login_path
      end
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
