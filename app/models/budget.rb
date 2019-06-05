class Budget < ApplicationRecord
    has_many :receipts , dependent: :destroy
    has_many :users, through: :receipts

end
