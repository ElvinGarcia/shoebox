class Budget < ApplicationRecord
    define_attribute_methods 
    has_many :receipts , dependent: :destroy
    validates :amount, numericality:{message:"%{value} is not a valid  %{model} %{attribute}"}
    validates :category, presence:{uniqueness: true , message:"that %{attribute} has been already taken"}
    
    


private

   def debits_credits(diff)
    self.amount = self.amount + diff
   end
   
  
end
