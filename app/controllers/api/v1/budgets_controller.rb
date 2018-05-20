module Api
  module V1
    class BudgetsController < ApplicationController
      before_action :set_budget, only: [:show, :update, :destroy]

      def index
        @budgets = Budget.all
      end

      def create
        @budget = Budget.new(budget_params)
        if @budget.save
          head :created
        else
          head :unprocessable_entity
        end
      end

      def show
      end

      def update
        if @budget.update(budget_params)
          head :accepted
        else
          head :unprocessable_entity
        end
      end

      def destroy
        @budget.delete
      end

      private

      def budget_params
        params.permit(:name)
      end

      def set_budget
        @budget = Budget.find(params[:id])
      end
    end
  end
end
