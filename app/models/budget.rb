class Budget < ApplicationRecord
    has_many :receipts
    has_many :users, through: :receipts

end
