class Store < ApplicationRecord
#connects to the cloud for retrieval of documents
    has_many :receipts
    has_many :users, through: :receipts

end