class ReceiptsController < ApplicationController



    def index
        @receipts = current_user.receipts.paginate(page: params[:page])
    end
    
    def new
        @receipt = Receipt.new
        @user   = current_user
    end

    def create
        @receipt = current_user.receipts.create(receipt_strong_params)
    end

    def edit
        
    end
    
    def update
        
    end

    def destroy
        
    end
    


    private

    def receipt_strong_params
        params.require(:receipt).permit(:content, :amount,:recurring)
    end
    
    
end
