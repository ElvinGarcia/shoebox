class Budget < ApplicationRecord
    define_attribute_methods 
    has_many :receipts , dependent: :destroy
    




   def debits_credits(diff)
    self.amount = self.amount + diff
   end
   
  
end
