class SessionsController < ApplicationController

  def create
    byebug

    #redirect to shoow page once the user is created 
    #and added to the session hash
    redirect_to users_path
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
