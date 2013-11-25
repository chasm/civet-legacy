Civet::Application.routes.draw do

  # User registration (coded links)
  get  'register/:code' => 'users#new',   as: :register        # Registration form
  post 'register/:code' => 'users#create'                      # Create new user/destroy registrant
  
  get    'login'  => 'session#new',     as: :login             # Login form
  post   'login'  => 'session#create'                          # Log user in (start session)
  delete 'logout' => 'session#destroy', as: :logout            # Log user out (end session)
  
  scope :api do
    
    get '' => 'api#index', as: :api, defaults: { format: :json }
    
    resources :jobs, except: [ :show, :new, :edit ], defaults: { format: :json } do
      get ':id' => 'jobs#index', on: :collection
    end
    
    resources :schools, except: [ :show, :new, :edit ], defaults: { format: :json } do
      get ':id' => 'schools#index', on: :collection
    end
    
    resources :refs, except: [ :show, :new, :edit ], defaults: { format: :json } do
      get ':id' => 'refs#index', on: :collection
    end
  
    resources :vitaes, except: [ :show, :new, :edit ], defaults: { format: :json } do
      get ':id' => 'vitaes#index', on: :collection
      get 'jobs(/:id)' => 'jobs#index', as: :jobs
      get 'schools(/:id)' => 'schools#index', as: :schools
      get 'refs(/:id)' => 'refs#index', as: :refs
    end
  
    get   'profile' => 'user#show',  as: :profile              # User information
    patch 'profile' => 'user#update'                           # Update user
    
  end
  
  # Public CV (coded link)
  get 'cv/:code' => 'vitae#show', as: :cv

  # Password reset (coded links)
  get   'reset/:code' => 'password#edit',  as: :reset          # Password reset form
  patch 'reset/:code' => 'password#update'                     # Reset users password
  
  get 'vitaes'    => 'site#index'
  get 'vitae/:id' => 'site#index'
  
  # Dashboard
  root 'site#index'
end
