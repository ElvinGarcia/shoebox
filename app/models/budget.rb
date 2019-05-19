class Budget < ApplicationRecord
    belongs_to :user
    has_many :receipts
    has_many :users, through: :receipts

end
