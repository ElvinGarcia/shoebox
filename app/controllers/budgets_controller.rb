class BudgetsController < ApplicationController
    before_action :find_the_budget, only: [:edit,:update,:destroy]

    def index
        @budgets = current_user.budgets.paginate(page: params[:page])
    end
    
    
    def new
        @budget = Budget.new
    end
   
    def create
        current_user.budgets.create!(budget_strong_param) #refractor opportunity could be done at model level
        redirect_to budgets_path
    end

    def edit
       
    end

    def update
      if  @budget.update_attributes(budget_strong_param)
        flash[:success] = "Budget was Successfully Updated"
        redirect_to budgets_path
      else
        render 'edit'
        flash[:notice] = "something went wrong"
      end
    end

    def destroy
        @budget.destroy
        flash[:notice] = "The Budget Was Deleted Succesfully"
        redirect_to budgets_path
    end
    

    private
    
    def find_the_budget
        @budget = current_user.budgets.find(params[:id])
    end
    

    def budget_strong_param
        params.require(:budget).permit(:amount,:category)
    end
    
end
