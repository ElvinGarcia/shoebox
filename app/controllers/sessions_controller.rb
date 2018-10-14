class SessionsController < ApplicationController

  def create
    
    @user = User.find_or_create_by(email: auth.info.email) do |user|
      user.name = auth.info.name
      user.email = auth.info.email
    end
    binding.pry
    #redirect to shoow page once the user is created 
    #and added to the session hash

  end

  private

  def auth
    request.env['omniauth.auth']
  end

  
end
