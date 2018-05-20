module Api
  module V1
    class CategoriesController < ApplicationController
      before_action :set_budget
      before_action :set_category, only: [:update, :destroy]

      def create
        category = @budget.categories.new(category_params)
        if category.save
          head :created
        else
          head :unprocessable_entity
        end
      end

      def update
        if @category.update(category_params)
          head :accepted
        else
          head :unprocessable_entity
        end
      end


      def destroy
        @category.delete
      end

      private

      def category_params
        params.permit(:name)
      end

      def set_budget
        @budget = Budget.find(params[:budget_id])
      end

      def set_category
        @category = @budget.categories.find(params[:id]) if @budget
      end
    end
  end
end
