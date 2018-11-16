class SessionsController < ApplicationController

  def login
    #raise "identify provider".inspect
    if auth != nil
           email = auth[:info][:email].downcase
        if @user = User.where('lower(email) = ?', email.downcase).first 
           log_in(@user)
           redirect_to user_path(@user)
        else 
          @user = User.create(name:auth[:info][:name] , email:auth[:info][:email], password:SecureRandom.hex ) 
          log_in(@user)
          redirect_to user_path(@user)
        end
     else
          email = params[:user][:email].downcase.strip!
          @user = User.find_by(email: email)
      if @user && @user.authenticate(params[:user][:password])
       log_in(@user)
       redirect_to user_path(@user)
      else
       flash[:alert]= "Wrong User Name or/and Password"
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
