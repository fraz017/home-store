Rails.application.routes.draw do

  namespace :api, constraints: { format: 'json' } do
    namespace :v1 do
      post '/generate' => 'verifications#generate_code'
      post '/verify' => 'verifications#verify_code'
      mount_devise_token_auth_for "User", at: 'auth', controllers: {
        registrations:  'overrides/registrations',
        sessions: 'overrides/sessions'
      }
      resources :products do 
        collection do
          get "/my_products", action: "my_products", :defaults => { :format => :json }
        end
      end

      post '/add_to_cart' => 'order_items#create'
      put '/increase_quantity' => 'order_items#update'
      put '/decrease_quantity' => 'order_items#update'
      delete '/remove_from_cart' => 'order_items#destroy'
      delete '/clear_cart' => 'order_items#clear'
      get '/cart' => 'carts#show'
      get '/orders' => 'orders#index'
      post '/add_address' => 'orders#add_address'

      resources :sub_categories
      resources :categories
      resources :properties
      resource :cart, only: [:show]
      resources :order_items, only: [:create, :update, :destroy]
    end
  end
  match '*unmatched_route', :to => 'application#raise_not_found!', :via => :all
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
