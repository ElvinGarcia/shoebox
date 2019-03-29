# frozen_string_literal: true

class User < ApplicationRecord
  attr_accessor :remember_token, :activation_token, :reset_token
  has_many :posts, dependent: :destroy
  #  has_one_attached :avatar #active_storage requirement
  #  has_many :images,  through: :posts
  #  association methods
  #  has_many
  #  has_many

  # validates the email submitted format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i.freeze

  # converts email to downcase  before saving it inorder to prevent inconsistency
  before_save { email.downcase! }
  before_create :create_user_digest

  # bcrypt encryption for the usr password
  has_secure_password

  # standard validations
  validates :name, presence: true, length: { minimum: 5 }
  #must have psw with a min. length of 5 allows nil psw when updating profile but not psw
  validates :password, presence: true, length: {minimum: 5}, allow_nil: true
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}

  #singleton class
  class << self
    # Returns the hash digest of the given string.
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    # returns a random url safe token
    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  # retrieves the set token
  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?  #no digest to validate against
    BCrypt::Password.new(digest).is_password?(token) 
  end

  # undoes #remember
  def forget
    update_attribute(:remember_digest, nil)
  end

  def activate
    #could be refractor into a single line ???????
    # update_attribute(:activated, true)
    # update_attribute(:activated_at, Time.zone.now)
    #direct update bypasses callbacks
    self.update_columns(activated: true , activated_at: Time.zone.now) 
  end

  #sends activation link when account is initiated
  def send_activation_mail
    UserMailer.account_activation(self).deliver_now
  end

  #sets and stores the password activation token in the datatbase
  def password_reset
    self.reset_token = User.new_token
    self.update_columns(reset_digest: User.digest(reset_token),reset_sent_at: Time.zone.now )
  end

  #sends password reset link
  def send_password_reset_mail
    UserMailer.password_reset(self).deliver_now
  end

  private
  def create_user_digest
    #creates a token and digest
    self.activation_token  = User.new_token
    self.activation_digest = User.digest(activation_token)
  end

end
