class ReceiptsController < ApplicationController
    before_action :find_receipt, only: [:edit,:update,:destroy]
    


    def index
        @receipts = current_user.receipts.where.not(amount: !nil).paginate(page: params[:page])
    end
    
    def new
        @receipt = Receipt.new
        @user = current_user
        if @user.receipts.empty?
            navigated_location
            flash[:notice] ="A Budget Must Be Created Before Creating a Receipt"
            redirect_to new_budget_path
        end
    end

    def create
       if Receipt.create!(receipt_strong_params)   
        flash[:notice] ="The Receipt Was Succesfully Created"
        redirect_to user_receipts_path(current_user)
       else
        flash[:notice] = "something went wrong"
        redirect_to new_user_receipt_path(current_user)
       end
    end

    def edit
        @user = current_user    
    end
    
    def update
        if @receipt.update(receipt_strong_params)
            flash[:notice] ="The Receipt Was Succesfully Updated"
            redirect_to user_receipts_path(current_user)
        else
            flash[:notice] ="Something Went Wrong"
            redirect_to user_receipt_edit_path(current_user)
        end
    end

    def destroy
        @receipt.destroy
        flash[:notice] ="The Receipt Was Succesfully Deleted"
        redirect_to user_receipts_path(current_user)
    end
    


    private

    def receipt_strong_params
        params.require(:receipt).permit(:content, :amount,:recurring,:user_id,:budget_id)
    end
    
    def find_receipt
        @receipt = current_user.receipts.find(params[:id])
    end


end
