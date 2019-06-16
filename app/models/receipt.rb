class Receipt < ApplicationRecord
    has_many_attached :images, dependent: :destroy    
    belongs_to :user
    belongs_to :budget
    
    
    

end
