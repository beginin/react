React::Application.routes.draw do
  get "pages/index"
  get "pages/directory"
  get "pages/help"
  resources :stimulreactions

  resources :worksheets do
    get 'upload' => 'worksheets#upload', :on => :collection
    post 'upload' => 'worksheets#uploadxls', :on => :collection
  end

  resources :reactions do
    get 'search' => 'reactions#search', :on => :collection
  end

  resources :stimuls do
    get 'search' => 'stimuls#search', :on => :collection
    get 'upload' => 'stimuls#upload', :on => :collection
    post 'upload' => 'stimuls#uploadcsv', :on => :collection
  end

  resources :cities do
    get 'search' => 'cities#search', :on => :collection
  end

  resources :specialties do
    get 'search' => 'specialties#search', :on => :collection
  end

  resources :languages do
    get 'search' => 'languages#search', :on => :collection
  end


  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#index'

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
