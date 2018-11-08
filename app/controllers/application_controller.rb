class ApplicationController < ActionController::Base
      include SessionsHelper
      include PostsHelper

    def index
        redirect_to users_path if logged_in?
    end

end