Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      namespace :items do
        resources :find_all, only: :index
      end
      resources :items do
        resources :merchant, only: :index, controller: :item_merchant
      end
      resources :merchants do
        resources :items, controller: :merchant_items do
        end
      end
    end
  end

  # namespace :api do
  #   namespace :v1 do
  #     scope module: 'merchant' do
  #       resources :search
  #     end
  #     resources :items
  #     resources :merchants do
  #       resources :items, controller: :merchant_items
  #     end
  #   end
  # end
end
