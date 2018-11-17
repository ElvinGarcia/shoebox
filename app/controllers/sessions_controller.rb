class SessionsController < ApplicationController

  def login
    omin_auth(auth)

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
