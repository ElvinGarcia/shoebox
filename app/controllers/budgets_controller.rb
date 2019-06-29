class BudgetsController < ApplicationController
    before_action :find_the_budget, only: [:edit,:update,:destroy,:show]

    def index
        @budgets = current_user.budgets.distinct.paginate(page: params[:page])
    end
    
    
    def new
        @budget = Budget.new
    end
   
    def create
        current_user.budgets.create!(budget_strong_param) #refractor opportunity could be done at model level
        flash[:notice] ="The Budget Was Succesfully Created"
        if session[:before_login]
            redirect_back_to_intent(current_user)
        else
        redirect_to budgets_path
        end
    end

    def show

    end
    

    def edit
       
    end

    def update
      if  @budget.update_attributes(budget_strong_param)
        flash[:success] = "Budget was Successfully Updated"
        redirect_to budgets_path
      else
        flash[:notice] = "something went wrong"
        render 'edit'
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
        params.require(:budget).permit(:category,:amount)
    end
    
end
