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
        render json: ItemSerializer.new(Item.create(item_params)), status: :created
      end

      def update
        if params[:item][:merchant_id] && Merchant.find_by(id: params[:item][:merchant_id]).nil?
          render status: 404
        else
          render json: ItemSerializer.new(Item.update(params[:id], item_params))
        end
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
