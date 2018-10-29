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
        @user = User.find_by(email:params[:user][:email])

        if @user && @user.authenticate(params[:user][:password])
            log_in(@user)
            render :show
        elsif @user
            flash[:alert]= "User name is already taken"
            redirect_to new_users_path
        else
            @user = User.create(strong_params)
            log_in @user 
            render :show
        end
    end

    def edit
      @user = current_user
    end

    def update
        current_user.update(strong_params)
        redirect_to users_path
    end

    def destroy
        binding.pry
        current_user.destroy
        log_out
        redirect_to root_path
    end

    private

    def strong_params
        params.require(:user).permit(:name,:email,:password,:admin,:avatar, pics: [])
    end
    
end