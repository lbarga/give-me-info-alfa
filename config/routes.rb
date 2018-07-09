Rails.application.routes.draw do
  get 'home/index'
  root to: 'home#index'
  
  namespace :api do
    namespace :v1 do
      resources :infos
    end
  end
  
  get '/home/computer/projects/give-me-info-alfa/drive/uploads' => 'info#download'

end
