class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar
  has_many_attached :pics
  has_many :receipts
  has_many :stores, through: :receipts
end
