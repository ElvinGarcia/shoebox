class SessionsController < ApplicationController

  def login
    if auth
      @user = User.find_or_create_by(email: auth[:info][:email].downcase) do |user|
        user.name = auth[:info][:name]
        user.email = auth[:info][:email].downcase
        user.password = SecureRandom.base64
       end
        log_in(@user)
        redirect_back_to_intent(@user)
#redirect_to user_path(@user), notice: "You are Logged In"       
    else
       @user = User.find_by(email: params[:user][:email])
      if @user && @user.authenticate(params[:user][:password])
        log_in(@user) 
       #verifies via params that the user selected to be remember then runs 
      #remember user instant method
        remember(@user) if params[:user][:remember] == "1"
      #redirects back to location before login
      redirect_back_to_intent(@user)
      else
        flash[:alert]="Invalid email/password combination"
        redirect_to login_path
      end
    end
  end



def logout
    log_out if logged_in?
    redirect_to root_path
end

  private

  def auth
    request.env['omniauth.auth']
  end

  
end
