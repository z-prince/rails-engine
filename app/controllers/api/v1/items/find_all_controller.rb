module Api
  module V1
    module Items
      class FindAllController < ApplicationController
        def index
          render json: ItemSerializer.new(
            Item.search(params[:name])
          )
        end
      end
    end
  end
end
