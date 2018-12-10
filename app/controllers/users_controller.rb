class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def show
      if  logged_in? 
         @user = current_user 
      else
         flash[:alert] = "You must be Logged in Order to View this Page"
         redirect_to root_path
        end
    end

    def login
      redirect_to users_path if logged_in?
    end
    
    def create
         @user = User.create(user_strong_params)
        if  @user.save
            log_in @user 
            flash[:notice]= "You Been Succesfully Registered"
            render :show
        else
          render :new
        end
    end

    def edit
      @user = current_user
    end

    def update
        current_user.update(user_strong_params)
        redirect_to users_path
    end

    def destroy
        current_user.destroy
        log_out
        redirect_to root_path
    end

    private     

    def user_strong_params
        params.require(:user).permit(:name,:email,:password,:password_confirmation,:admin)
    end
    
end