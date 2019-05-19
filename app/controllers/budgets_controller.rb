class BudgetsController < ApplicationController
    def new
        @budget = Budget.new
    end
   
    def create
        binding.pry
        @budget = Budgets.create(budget_strong_param)
    end

    private
    
    def budget_strong_param
        params.require(:budget).permit(:amount,:category)
    end
    
end
