Rails.application.routes.draw do
  root 'pages#home'

  resources :instructors do
    delete 'terminate' => 'employees#destroy'
  end

  resources :courses do
    delete 'terminate' => 'courses#destroy'
    resources :cohorts do
      delete 'terminate' => 'cohorts#destroy'
    end
    resources :students do
      delete 'terminate' => 'students#destroy'
    end
  end

  get '/register' => 'instructors#new'
  get '/students' => 'students#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  get 'pages/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
