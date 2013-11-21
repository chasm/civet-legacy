Civet::Application.routes.draw do

  # User registration (coded links)
  get  'register/:code' => 'users#new',   as: :register        # Registration form
  post 'register/:code' => 'users#create'                      # Create new user/destroy registrant
  
  get    'login'  => 'session#new',     as: :login             # Login form
  post   'login'  => 'session#create'                          # Log user in (start session)
  delete 'logout' => 'session#destroy', as: :logout            # Log user out (end session)
  
  scope :api do
    
    resources :jobs, except: [ :show, :new, :edit ], defaults: { format: :json } do
      get ':ids' => 'jobs#index', on: :collection, constraint: /\d+,(\d+(,?)+)/, as: :filtered
    end
    
    resources :schools, except: [ :show, :new, :edit ], defaults: { format: :json } do
      get ':ids' => 'schools#index', on: :collection, constraint: /\d+,(\d+(,?)+)/, as: :filtered
    end
    
    resources :refs, except: [ :show, :new, :edit ], defaults: { format: :json } do
      get ':ids' => 'refs#index', on: :collection, constraint: /\d+,(\d+(,?)+)/, as: :filtered
    end
  
    resources :vitaes, except: [ :show, :new, :edit ], defaults: { format: :json } do
      
      resources :jobs, only: [ :index ], defaults: { format: :json } do
        get ':ids' => 'jobs#index', on: :collection, constraint: /\d+,(\d+(,?)+)/, as: :filtered
      end
      
      resources :schools, only: [ :index ], defaults: { format: :json } do
        get ':ids' => 'schools#index', on: :collection, constraint: /\d+,(\d+(,?)+)/, as: :filtered
      end
      
      resources :refs, only: [ :index ], defaults: { format: :json } do
        get ':ids' => 'refs#index', on: :collection, constraint: /\d+,(\d+(,?)+)/, as: :filtered
      end
      
      get ':ids' => 'vitaes#index', on: :collection, constraint: /\d+,(\d+(,?)+)/, as: :filtered
      
    end
  
    get   'profile' => 'user#show',  as: :profile              # User information
    patch 'profile' => 'user#update'                           # Update user
    
  end
  
  # Public CV (coded link)
  get 'cv/:code' => 'vitae#show', as: :cv

  # Password reset (coded links)
  get   'reset/:code' => 'password#edit',  as: :reset          # Password reset form
  patch 'reset/:code' => 'password#update'                     # Reset users password
  
  # Dashboard
  root 'site#index'
end
