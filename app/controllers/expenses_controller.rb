class ExpensesController < ApplicationController
    def index 
        @user = User.find(params[:user_id])
        @expenses = @user.expenses
        render json: @expenses
    end

    def create  
        @expense = Expense.new(expense_params)
        if @expense.save 
            render json: @expense
        else 
            render json: {error: @expense.errors.messages, messages: "error in creating expense"}, status: 422
        end
    end

    def update 
        @expense = Expense.find(params[:id])
        if @expense.update(expense_params)
            render json: @expense
        else
            render json: {error: @expense.errors.messages, messages: "error in updating expense"}, status: 422
        end
    end

    private

    def expense_params
        params.permit(:amount, :date, :description, :category_id, :user_id, :is_cashin)
    end
end
