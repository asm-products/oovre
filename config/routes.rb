Blogee::Application.routes.draw do
  
  resource :users, only: [:new, :create]
  get 'user/:id' => 'users#show'

end