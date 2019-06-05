class ReceiptsController < ApplicationController



    def index
        @receipts = current_user.receipts.paginate(page: params[:page])
    end
    
    def new
        @receipt = Receipt.new
        @user   = current_user
        if @user.receipts.empty?
           navigated_location
            flash[:notice] ="A Budget Must Be Created Before Creating a Receipt"
            redirect_to new_budget_path
        end
    end

    def create
        @receipt = current_user.receipts.create(receipt_strong_params)
       if @receipt.valid?   
        flash[:notice] ="The Receipt Was Succesfully Created"
        redirect_to user_receipts(current_user)
       else
        flash[:notice] = "something went wrong"
        redirect_to new_user_receipt_path(current_user)
       end
    end

    def edit
        
    end
    
    def update
        flash[:notice] ="The Receipt Was Succesfully Updated"
    end

    def destroy
        @receipt = current_user.receipts.find(params[:id]) 
        @receipt.destroy
        flash[:notice] ="The Receipt Was Succesfully Deleted"
        redirect_to user_receipts_path(current_user)
    end
    


    private

    def receipt_strong_params
        params.require(:receipt).permit(:content, :amount,:recurring)
    end
    
    
end
