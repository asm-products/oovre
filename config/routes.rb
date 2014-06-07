Blogee::Application.routes.draw do

  devise_for :users, :path => '', :path_names => {
    :sign_in => "login",
    :sign_out => "logout",
    :sign_up => "register",
    :edit => "settings"
  }, :controllers => { :registrations => "registrations" }

  # Keep unless we just make a CMS...
  get 'about/',     to: 'pages#about',    as: 'page_about'
  get 'team/',      to: 'pages#team',     as: 'page_team'
  get 'features/',  to: 'pages#features', as: 'page_features'

  get 'explore/', to: 'explore#index', as: 'explore'

  scope :admin do
    get '', to: 'admin#index', as: 'admin'
    get 'users', to: 'admin#users', as: 'admin_user_management'
    get 'articles', to: 'admin#articles', as: 'admin_article_management'
  end

  namespace :api do
    namespace :users, path: 'user' do
      get :follower_count
      post :follow
      post :unfollow
    end
    namespace :articles, path: 'article' do
      post :basic_stats
    end
  end

  # Dashboard is ajax based, SPA... Doesn't need much.
  scope 'dashboard' do
    get '',   to: 'dashboard#index',    as: 'user_dashboard'
  end

  resource :articles,         path: 'article', only: [:new, :edit, :create, :update, :destroy]
  resource :article_sets,     path: 'set'
  resource :article_comments, path: 'comments'

  #### VERY BOTTOM IN ORDER OF IMPORTANCE
  get 'article/:id', to: 'articles#show'
  get ':username', to: 'users#show', as: 'user_profile'
  scope ':username' do
    get ':id/:title', to: 'articles#show', as: 'article_show'
  end

  devise_scope :user do
    authenticated :user do
      root to: 'users#home', as: 'user_home'
    end
    unauthenticated :user do
      root to: 'pages#landing', as: 'page_landing'
    end
  end

  #### NOT IMPORTANT!!!!
  ## Implement later...
  ## New article url structure...
  # scope ':username' do
  #   get ':id', to: 'articles#show', as: 'article'
  # end

end
