Blogee::Application.routes.draw do

  get 'about/' => 'pages#about', as: 'page_about'
  get 'team/' => 'pages#team', as: 'page_team'
  get 'features/' => 'pages#features', as: 'page_features'

  devise_for :users, :path => '', :path_names => {
    :sign_in => "login",
    :sign_out => "logout",
    :sign_up => "register",
    :edit => "settings"
  }, :controllers => {
    :registrations => "registrations"
  }

  resource :articles, only: [:create, :update, :delete]

  get 'a/new' => 'articles#new', as: 'new_article'
  get 'article/:id' => 'articles#show', as: 'article'

  get 'user/:username' => 'users#show', as: 'user_profile'

  devise_scope :user do
    authenticated :user do
      root to: 'users#home', as: 'user_home'
    end

    unauthenticated :user do
      root to: 'pages#landing', as: 'page_landing'
    end
  end

end