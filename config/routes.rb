Rails.application.routes.draw do


  get 'blogs/show'

  get 'blog/show'
  get 'blog/contacts', as:"contacts"
  mount Ckeditor::Engine => '/ckeditor'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'blog#index'
  resources :blogs
  get '/delete_photo/:id'=>'ajax#delete_image',as:"delete_photo"
  resources :ajax do
    collection do
      post 'login'=>'ajax#login', as: 'login'
      get 'logout'=>'ajax#logout',as:"logout"
      post 'add_photo'=>'ajax#add_photo', as:"add_photo"

      put 'edit_post'=>'ajax#edit_post'


      get  'delete_post/:id'=>'ajax#delete_post'


      post 'create_post'=>'ajax#create_post'
      get 'get_post/:id'=>'ajax#get_post'
    end
  end

  resources :photos
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
