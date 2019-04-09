class Post < ApplicationRecord
    belongs_to :user
    has_many_attached :images, dependent: :destroy
    validates :description, presence: true
    validates :title, presence: true
    default_scope {order(created_at: :desc)}

end