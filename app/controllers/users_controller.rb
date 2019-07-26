# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :user_login, only:[:index, :edit, :update]
  before_action :corresponding_user, only:[:edit, :update]
  
  def new
    @user = User.new
  end

  def create
    @user = User.create(user_strong_params)
    if @user.save
      @user.send_activation_mail
      flash[:info] = "To Complete The Activation Please Check Your Email"
      redirect_to root_url
    else
      render :new
    end
  end

  def show
    if logged_in?
      @user = current_user
    else
      flash[:alert] = 'You must be Logged in Order to View this Page'
      redirect_to login_path
    end
  end

  def index
    #prevents none activated users from being display 
    @users = User.where(activated: true).paginate(page: params[:page], per_page:10)
  end


  def login
    redirect_to users_path if logged_in?
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_strong_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end

  end

  def destroy
      user = User.find(params[:id])
      delete_account(user)
      flash[:notice] = 'The Account Was Succesfully Deleted'
      redirect_to root_path    
  end

    
 


private

  def user_strong_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :admin)
  end

  # before actions

#must be logged in to edit or update any resources
  def user_login
    unless logged_in?
      navigated_location  #stores the location that was navigated before login
      flash[:alert]= "You Must Be Log In Order To Access that Portion of the Site" 
      redirect_to login_path
    end
  end

#only the corresponding resoure could be edit or updated
  def corresponding_user
  @user = User.find(params[:id])
    if  current_user?(@user)
    else
      flash[:alert]= "Resource is not Available"
      redirect_to root_path
    end
  end

end 