
class PasswordResetsController < ApplicationController
    before_action :find_user, [:edit, :update]
    before_action :token_validation, [:edit, :update]

    def new
    
    end
    
    def create 
        user = User.find_by(email: params[:password_reset][:email])
        if user
            user.password_reset #generates user digest hash
            user.send_password_reset_mail #sends email witih reset link
            flash[:success] = "Please Check your email with instructions on reseting your password"
        
        else
            flash[:danger] = "An Email was send to the email provided if it exists"
        end
        redirect_to root_path
    end
    
    def edit 
        @user = User.find_by(email: params[:email])      
        
    end
    
    def update
        binding.pry
    end

    private
    #finds the user in the datatbase
    def find_user
        
    end


    # def token_validation(user)
    #     user.authenticated?(:reset,params[:id])
    # end


end



