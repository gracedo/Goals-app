GoalSetter::Application.routes.draw do
  resources :users do
    resources :goals do
      post 'completed', to: 'goals#completed', as: :completed
    end
  end
  resource :session
  get '/goals', to: 'goals#public_goals', as: :goals
end
