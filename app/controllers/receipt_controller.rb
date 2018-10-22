class ReceiptsController < ApplicationController

    def index
        @receipts = Receipt.all
    end

    def new
        @receipt = Receipt.new
    end

    def create
        #validates the receipt info
        #sends it to the receipt model for validation
        #the model sends it to the cloud for storage
        #redirects to the receipt shwo page
        redirect_to stores_receipt(@receipts)
    end
    
end