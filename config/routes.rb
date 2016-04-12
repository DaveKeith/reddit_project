Rails.application.routes.draw do
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

  root to: "posts#index"
  get "posts/new", to: "posts#new", as: "posts_new"
  post "posts", to: "posts#create"

  get "posts/:id/edit", to: "posts#edit", as: "posts_edit"
  patch "posts/:id/update", to: "posts#update", as: "post"
  get "posts/:id", to: "posts#show", as: "posts_display"
  get "posts/:id/delete", to: "posts#delete", as: "posts_delete"

  get "logins/new", to: "logins#new", as: "logins"
  get "logins", to: "logins#show", as: "show_login"
  post "logins", to: "logins#create", as: "create_login"
  get "logins/:id/delete", to: "logins#delete", as: "logouts"

  get "new_users/new", to: "new_users#new", as: "users_new"
  post "new_users", to: "new_users#create", as: "register_users"

  resources :posts do
    resources :comments
  end

  get "posts/:id", to: "comments#new", as: "new_comments"
  post "posts/:id", to: "comments#create", as: "comment_on_post"
  get "posts/:id", to: "comments#show", as: "comment_display"
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
