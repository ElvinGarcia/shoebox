class ActivationsController < ApplicationController

    def edit
            user = User.find_by(email: params[:email])
        if user && user.authenticated?(:activation,params[:id]) && !user.activated? #makes sure the user havent been activated before 
            user.activate
            log_in(user)
            flash[:notice]="Account Activation was Successful"
            redirect_to user
        else
            flash[:alert]="Unable to activate the account activation link"
            redirect_to login_path
        end
    end
end
