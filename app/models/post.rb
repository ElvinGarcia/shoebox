class Post < ApplicationRecord
    belongs_to :user
    has_many_attached :images, dependent: :destroy
    validates :description, presence: true
    validates :title, presence: true

end