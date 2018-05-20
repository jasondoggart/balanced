module Api
  module V1
    class LineItemsController < ApplicationController
      before_action :set_category
      before_action :set_line_item, only: [:update, :destroy]

      def create
        line_item = @category.line_items.new(line_item_params)
        if line_item.save
          head :created
        else
          head :unprocessable_entity
        end
      end

      def update
        if @line_item.update(line_item_params)
          head :accepted
        else
          head :unprocessable_entity
        end
      end

      def destroy
        @line_item.delete
      end

      private

      def line_item_params
        params.permit(:name)
      end

      def set_category
        @category = Category.find(params[:category_id])
      end

      def set_line_item
        @line_item = @category.line_items.find(params[:id]) if @category
      end
    end
  end
end
