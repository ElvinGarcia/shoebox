class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
        binding.pry
    end

    def create
        @user = User.find_by(email:params[:user][:email])

        if @user && @user.authenticate(params[:user][:password])
            log_in(@user)
            render :show
        else
            flash[:alert]= "Invalid User name / password combination"
            redirect_to login_path
        end
        
    end

    def edit
        @user = #find the user 
        #send the user to get edited
        redirect_to edit_users(@user)
    end

    def update
        #update the users attributes
        #redirect to the show page
        redirect_to users_path(@user)
    end

    private

    def strong_params
        params.require(:user).permit([:name,:email,:password,:admin])
    end
    
end