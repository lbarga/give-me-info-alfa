Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  
  namespace :api do
    namespace :v1 do
      resources :infos
      resource :session, only: [:destroy]
    end
  end

  namespace :api do
    namespace :v1 do
      namespace :destroy do
        resource :session, only: [:destroy]
      end
    end
  end
  
  
  get '/home/computer/projects/give-me-info-alfa/drive/uploads' => 'info#download'

end
