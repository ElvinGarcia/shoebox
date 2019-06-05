class Receipt < ApplicationRecord
    belongs_to :user
    belongs_to :budget

    has_many_attached :images, dependent: :destroy    
    validates :budget_id, presence: true
    #validates :content, :amount, presence: true
    
    

end
