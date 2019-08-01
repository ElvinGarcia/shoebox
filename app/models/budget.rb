class Budget < ApplicationRecord
    has_many :receipts , dependent: :destroy
    after_save :balance_setter


private
    def balance_setter
        if !self.balance
        self.update_attribute(:balance, self.amount)
        end
    end
end
