module Api
  module V1
    module Merchants
      class FindController < ApplicationController
        def index
          merchant = Merchant.search(params[:name])
          if merchant.nil?
            render json: { data: {} }, status: 400
          else
            render json: MerchantSerializer.new(merchant)
          end
        end
      end
    end
  end
end
