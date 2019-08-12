class Receipt < ApplicationRecord
    define_attribute_methods

    has_many_attached :images, dependent: :destroy    
    belongs_to :user
    belongs_to :budget
    before_update :edited, if: :amount_changed?
    before_save :instantiation
    after_commit :set_for_deletion, on: :destroy

  
private 

def edited
      transaction do
      diff =  self.amount_was - self.amount
      budget.widthdraw(diff)
      budget.save!
      end
end

def instantiation
    transaction do
    budget.widthdraw(amount)
    budget.save!
    end
end

def set_for_deletion
  transaction do
  budget.deposit(amount)
  budget.save!
  end
end

    
    

end
