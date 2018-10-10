class User < ApplicationRecord
  has_secure_password
  has_may :receipts
  has_may :stores, through: :receipts
end
