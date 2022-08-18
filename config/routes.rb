Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    namespace :v1 do
      namespace 'users' do
        post '/sign_up' , to: 'users#sign_up'
        post '/sign_in' , to: 'users#sign_in'
      end
    end
  end

  # Defines the root path route ("/")
  # root "articles#index"
end
