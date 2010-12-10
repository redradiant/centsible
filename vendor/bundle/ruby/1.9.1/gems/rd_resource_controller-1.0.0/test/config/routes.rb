TestApp::Application.routes.draw do
  resources :projects
  resources :people
  resources :dudes
  resources :users do
    resources :photos
    resource :image
  end

  resources :somethings
  resources :photos do
    resources :tags
  end

  resources :tags
  namespace :cms do
    resources :products do
      resources :options
    end
    resources :personnel do
      resources :photos
    end
  end

  resources :posts do
    resources :comments
  end

  resources :comments
  resource :account
  resource :image
  resources :options
  match ':controller/service.wsdl' => '#wsdl'
  match '/:controller(/:action(/:id))'
end