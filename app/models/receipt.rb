class Receipt < ApplicationRecord
    define_attribute_methods

    has_many_attached :images, dependent: :destroy    
    belongs_to :user
    belongs_to :budget

    after_validation :edited, on: [:update, :create]
    after_destroy :deleted_record



    def self.most_expensive
      order('amount desc').limit(3)
    end

  
private 

  def edited
       was = self.amount_was ? self.amount_was: 0
       diff =  was - amount
       budget.send :debits_credits,diff
       budget.save!
  end  
    
  def deleted_record
    budget.send :debits_credits,self.amount_was
    budget.save!
  end
  


end
