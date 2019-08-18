class Receipt < ApplicationRecord
    define_attribute_methods

    has_many_attached :images, dependent: :destroy    
    belongs_to :user
    belongs_to :budget
    validates :content, :amount, presence: true
    after_validation :edited, on: [:update, :create]
    #after_commit :set_for_deletion, on: :destroy

  
private 

  def edited
       was = self.amount_was ? self.amount_was: 0
       diff =  was - amount
       budget.debits_credits(diff)
       budget.save!
  end  
    

end
