class User < ApplicationRecord
  #validates the email submitted format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #converts email to downcase  before saving it inorder to prevent inconsistency 
  before_save {email.downcase!}
  # standard validations 
  validates :name, presence: true, length: {minimum: 5}
  validates :password, presence: true, length: {minimum: 5}
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  #bcrypt encryption for the usr password
  has_secure_password
  #active_storage requirements
  has_one_attached :avatar
  has_many_attached :pics
  #association methods
  #has_many 
  #has_many 
  :omniauthable
  #devise :omniauthable, omniauth_providers: %i[github]


  def omin_auth(auth)

          #raise "identify provider".inspect
      if auth != nil
            email = auth[:info][:email].downcase
          if @user = User.where('lower(email) = ?', email.downcase).first 
            log_in(@user)
            redirect_to user_path(@user)
          else 
            @user = User.create(name:auth[:info][:name] , email:auth[:info][:email], password:SecureRandom.hex ) 
            log_in(@user)
            redirect_to user_path(@user)
          end
      else
            email = params[:user][:email].downcase.strip!
            @user = User.find_by(email: email)
        if @user && @user.authenticate(params[:user][:password])
        log_in(@user)
        redirect_to user_path(@user)
        else
        flash[:alert]= "Wrong User Name or/and Password"
        redirect_to login_path                                                                                                                          
      end
    end
    end
    
  end

end
