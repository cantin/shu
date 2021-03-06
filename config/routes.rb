Shu::Application.routes.draw do
  
  devise_for :admins

  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  get '/books/search' => 'books#search', as: :book_search
  get "/books/tags/:name" => 'books#tags', as: :books_tag
  post '/books/:id/comment' => 'comments#create', as: :comments

  post '/users/follow' => 'users#follow', as: :user_follow
  post '/users/unfollow' => 'users#unfollow', as: :user_unfollow
  get '/user/books' => 'users#books'

  get '/topics/tags/:name' => 'topics#tags', as: :topics_tag
  post '/topics/:id/comment' => 'comments#topic_create'

  resources :users
  resources :topics
  resources :books
  resources :homes

  root to: 'homes#index'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
