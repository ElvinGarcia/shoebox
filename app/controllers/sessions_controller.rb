class SessionsController < ApplicationController

  def create
    byebug
    redirect_to new_users_path
    
  end

  private

  def auth
    request.env['omniauth.auth']
  end

end
