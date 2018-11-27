
module SessionsHelper

    #add user to the current session
    def log_in (user)
        session[:user_id] = user.id
    end

    #returns the current user
    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
        else
            #retrive the user_id from the cookie and validate the remember_digest
            #and then set the current_user
        end
    end

    # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_user.nil?
  end

    #logout the user and sets @user to nil
    def log_out
        session.delete(:user_id)
        current_user = nil
    end

    def remember(user)
        user.remember
        user.cookies.permanent.signed[:user_id]= user.id
        user.cookies.permanent[:remember_token] = user.remember_token
    end

end