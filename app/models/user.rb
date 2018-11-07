class User < ApplicationRecord
  #validates the email submitted format
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  #converts email to downcase  before saving it inorder to prevent inconsistency 
  before_save {email.downcase!}
  # standard validations 
  validates :name, presence: true, length: {maximum: 10}
  validates :password, presence: true, length: {minimum: 4}
  validates :email, presence: true, length: {maximum: 255}, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive: false}
  #bcrypt encryption for the usr password
  has_secure_password
  #active_storage requirements
  has_one_attached :avatar
  has_many_attached :pics
  #association methods
  has_many :receipts
  has_many :stores, through: :receipts
end
