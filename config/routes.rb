Blogee::Application.routes.draw do

  ######## Global Routes by Third-party
  devise_for :users, :path => '', :path_names => {
    :sign_in => "login",
    :sign_out => "logout",
    :sign_up => "register",
    :edit => "settings"
  }, :controllers => { :registrations => "registrations" }


  ######## API Routes
  namespace :api do
    get 'users/follow_status/:user_id' => 'users#follow_status'
    post 'users/follow/' => 'users#follow'
    post 'users/unfollow' => 'users#unfollow'
    resource :articles
    resource :article_sets
    resource :article_comments
  end

  ######## Application Routes
  # admin
  namespace :admin do
    get '' => 'admin#index', as: 'admin'
  end

  # users
  get 'user/:username' => 'users#show', as: 'user_profile'

  # dashboard
  get 'dashboard' => 'dashboard#index', as: 'user_dashboard'

  # articles
  resource :articles, only: [:create, :update, :delete]
  resource :article_sets, only: [:create, :update, :delete]
  resource :article_comments, only: [:create, :update, :delete]
  get 'a/new' => 'articles#new', as: 'new_article'
  get 'article/:id' => 'articles#show', as: 'article'


  ######## Static Routes
  get 'about/' => 'pages#about', as: 'page_about'
  get 'team/' => 'pages#team', as: 'page_team'
  get 'features/' => 'pages#features', as: 'page_features'


  ######## Changing routes based on guest or user status
  devise_scope :user do
    authenticated :user do
      root to: 'users#home', as: 'user_home'
    end
    unauthenticated :user do
      root to: 'pages#landing', as: 'page_landing'
    end
  end

end
