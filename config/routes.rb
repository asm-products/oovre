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
  scope 'user' do
    get ':username' => 'users#show', as: 'user_profile'
  end

  # dashboard
  scope 'dashboard' do
    get '' => 'dashboard#index', as: 'user_dashboard'
  end

  # articles
  scope 'article' do 
    get 'new' => 'articles#new', as: 'article_new'
    get ':id' => 'articles#show', as: 'article'
    get ':id/edit' => 'articles#show', as: 'article_edit'
  end

  # article sets
  scope 'set' do
    get 'new' => 'article_sets#new', as: 'article_set_new'
  end
  resource :articles, only: [:create]
  get 'article/:id/edit' => 'articles#edit', as: 'edit_article'
  patch 'article/:id' => 'articles#update', as: 'update_article'
  delete 'article/:id' => 'articles#destroy', as: 'article_delete'
  resource :article_sets
  resource :article_comments


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
