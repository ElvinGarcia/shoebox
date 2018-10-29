class ApplicationController < ActionController::Base
      include SessionsHelper
      include ReceiptsHelper

    def index
        redirect_to users_path if logged_in?
    end

end