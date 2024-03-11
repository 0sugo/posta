Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  namespace :api do
    # resources :objectives, only: [:create]
    resources :objectives, only: [:index, :create, :update]
    resources :kpis
    resources :employees, only: [:index, :show] do
      collection do
        get :supervisors
      end
    end
  end

end
