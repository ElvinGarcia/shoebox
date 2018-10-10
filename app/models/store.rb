class Store < ApplicationRecord
#connects to the cloud for retrieval of documents
    has_may :receipts
    has_may :users, through: :receipts

end