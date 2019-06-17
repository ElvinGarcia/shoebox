class Receipt < ApplicationRecord
    has_many_attached :images, dependent: :destroy    
    belongs_to :user
    belongs_to :budget
    before_save :balance_adjuster
    

    private

    def balance_adjuster
        
    end
    
    

end
