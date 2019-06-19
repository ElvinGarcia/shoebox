module BudgetsHelper

    def balance_updater(receipt)
        receipt_amount = receipt.amount # if nil assign 0 else assign value
        budget_amount = budget.amount
        update_budget_amount(receipt_amount, budget_amount)
    end

    def update_budget_amount(receipt_amount, budget_amount)
        new_balance  = (budget_amount - receipt_amount)
         budget.update_attribute(:amount,new_balance)
    end
    
    
    
    
end
