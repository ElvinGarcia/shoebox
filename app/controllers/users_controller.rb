class UsersController < ApplicationController

    def new
        @user = User.new
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
    
end