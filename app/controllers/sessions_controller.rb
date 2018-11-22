class SessionsController < ApplicationController

  def login
    User.omin_auth(auth: auth, params: params )
    # User.omin_auth(auth)
    # if auth
    #   User.omin_auth(auth)
    # else
    #   User.omin_auth(params)
    # end
    

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
