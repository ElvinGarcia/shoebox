class Post < ApplicationRecord
    belongs_to :user
    has_many_attached :images
    validates :description, presence: true
    
end