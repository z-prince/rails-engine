Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :items
      resources :merchants do
        resources :items, controller: :merchant_items
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
