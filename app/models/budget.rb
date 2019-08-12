class Budget < ApplicationRecord
    define_attribute_methods 
    has_many :receipts , dependent: :destroy
    



    def widthdraw(diff)
        self.amount -= diff
    end

   def deposit(amount)
       self.amount += amount
   end
   
  
end
