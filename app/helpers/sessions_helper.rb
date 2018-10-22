
module SessionsHelper

    #add user to the current session
    def log_in (user)
        session[:user_id] = user.id
    end

    #returns the current user
    def current_user
        if session[:user_id]
            @current_user ||= User.find(session[:user_id])
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

end