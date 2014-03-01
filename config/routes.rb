GoalSetter::Application.routes.draw do
  resources :users do
    resources :goals do
      resources :goal_comments, only: [:create, :destroy]
      post 'completed', to: 'goals#completed', as: :completed
    end
    resources :user_comments, only: [:create, :destroy]
  end
  resource :session
  get '/goals', to: 'goals#public_goals', as: :goals
end
