
class PasswordResetsController < ApplicationController
    before_action :find_user, only: [:edit, :update]
    before_action :token_validation, only: [:edit, :update]
    before_action :expired_token, only: [:edit, :update]
    
    def new

    end
    
    def create 
        #finds the user in the DB
        user = User.find_by(email: params[:password_reset][:email])
        #if user is found
        if user 
            user.password_reset #generates user digest hash
            user.send_password_reset_mail #sends email witih reset link
            flash[:notice] = "Please Check your Email For Instructions on Reseting your Password"
        else
            flash[:alert] = "An Email was send if it exists"
        end
        redirect_to root_path
    end
    
    def edit 
    
    end
    
    def update
        #checks to see if the password field is empty
        if params[:user][:password].empty?
            flash[:alert] = "Password Field Can't Be Empty"
            render 'edit'
        # updates the atttribute in one transaction only if it passes validation
        elsif  @user.update(password_reset_strong_params)
            log_in(@user) 
            @user.update_attribute(:reset_digest, nil) #reset the reset_digest to prevent reuse of the token
            flash[:notice]= "The Password Was Updated"
            redirect_back_to_intent(@user)        
        else
            render 'edit'
        end
    end

    private
    def password_reset_strong_params
        params.require(:user).permit(:password, :password_confirmation)
    end

    #finds the user in the datatbase
    def find_user
        @user = User.find_by(email: params[:email])
    end

    #validates reset token
    def token_validation    
        unless @user && @user.activated? && @user.authenticated?(:reset, params[:id]) 
            redirect_to root_path
        end
    end

    #validates the experation of the reset token against the send timestamp 
    def expired_token
        if @user.password_reset_expired?
            flash[:alert]= "The Reset Link Expired.!"
            redirect_to new_password_reset_path
        end
    end
    
    


end



