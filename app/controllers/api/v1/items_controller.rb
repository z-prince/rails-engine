module Api
  module V1
    class ItemsController < ApplicationController
      def index
        render json: ItemSerializer.new(Item.all)
      end

      def show
        render json: ItemSerializer.new(Item.find(params[:id]))
      end

      def create
        item = Item.create(item_params)
        return unless item.save

        render json: ItemSerializer.new(item), status: :created
      end

      def update
        render json: Item.update(params[:id], item_params)
      end

      def destroy
        render json: Item.delete(params[:id])
      end

      private

      def item_params
        params.require(:item).permit(:name, :description, :unit_price, :merchant_id)
      end
    end
  end
end
