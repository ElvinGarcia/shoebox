class ApplicationController < ActionController::Base
      include SessionsHelper
      include PostsHelper
      include ApplicationHelper
      include UsersHelper

end