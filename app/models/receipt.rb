class Receipt < ApplicationRecord
    has_many_attached :images, dependent: :destroy    
    belongs_to :user
    belongs_to :budget
    #validates :content,:amount, presence: true
    
    
    
    
    
    

end
