class User < ApplicationRecord
  attr_acessor :remember_token
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

# Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
  
  #returns a random url safe token
  def User.new_token
    SecureRandom.urlsafe_base64
  end

  #retrieves the set token
  def remember
    self.remember_token = ...
    update_attribute(:remember_digest, ...)
  end

 end
