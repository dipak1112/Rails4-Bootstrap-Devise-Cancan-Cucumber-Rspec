Rails4RspecCucumberTesting::Application.routes.draw do
  #devise_for :users
  authenticated :user do
    get 'home/index'
  end
  root 'home#index'
  devise_for :users,:controllers => { :omniauth_callbacks => "user/omniauth_callbacks"} do 
    get '/users/sign_out' => 'devise/sessions#destroy' 
  end
  resources :users
end
