class Receipt < ApplicationRecord
    belongs_to :user
    belongs_to :budget
    
    has_many_attached :images, dependent: :destroy    
    validates :content, presence: true
    validates :amount, presence: true
end
