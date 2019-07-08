class Receipt < ApplicationRecord
    has_many_attached :images, dependent: :destroy    
    belongs_to :user
    belongs_to :budget
    after_save :balance_adjuster
    

    private

    def balance_adjuster
        balance_updater(self) unless self.amount.nil?
    end
    
    

end
