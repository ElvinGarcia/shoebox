class Receipt < ApplicationRecord
    define_attribute_methods

    has_many_attached :images, dependent: :destroy    
    belongs_to :user
    belongs_to :budget

    validates :content, presence: true
    after_validation :edited, on: [:update, :create]
    after_destroy :deleted_record

  
private 

  def edited
       was = self.amount_was ? self.amount_was: 0
       diff =  was - amount
       budget.debits_credits(diff)
       budget.save!
  end  
    
  def deleted_record
    budget.debits_credits(self.amount_was)
    budget.save!
  end
  


end
