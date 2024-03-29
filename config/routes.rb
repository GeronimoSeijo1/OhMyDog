Rails.application.routes.draw do

  resources :missing_posts
  resources :donations do
    post 'donate', on: :collection
    member do
      get 'confirm_donate'
      get 'confirm_delete'
    end
  end


  resources :vacunas, only: [:new, :create, :edit, :edit2, :update, :destroy] do
    member do
      get 'confirm_delete'
      get 'confirm_delete2'
      get 'edit2'
      post 'edit2'
    end
  end

  get '/download_HistoriaClinica/:dog_id(.:format)', to: 'medical_stories#downloadHC', as: 'download_historia_clinica', defaults: { format: :pdf }
  get '/download_LibretaSanitaria/:dog_id(.:format)', to: 'health_records#downloadLS', as: 'download_libreta_sanitaria', defaults: { format: :pdf }

  resources :health_records do
  end
  
  resources :medical_stories do
  end

  resources :dogs do
    member do
      get 'confirm_delete'
    end
  end
  resources :registers, only: [:index, :new, :create]
  resources :admin_registers, only: [:index, :new, :create]
  get 'dashboard/home'
  root 'homepage#home'

  devise_for :users, skip: [:registrations], controllers: { sessions:'users/sessions'}

  # Rutas para editar usuario y otras funcionalidades proporcionadas por Devise
  resources :users, only: [:edit, :update] do
    member do
      get 'user_dogs', to: 'dogs#index_user_dogs', as: 'user_dogs'
    end
  end

  # Rutas personalizadas para el registro de usuario
  get "/registers", to: "registers#new", as: :new_user_registration
  post "/registers", to: "registers#create", as: :user_registration
  # Rutas para editar y actualizar la contraseña
  get "/registers/edit/:id", to: "registers#edit", as: :edit_user_registration
  patch "/registers/update/:id", to: "registers#update", as: :update_user_registration

  # Rutas de cuidadores y paseadores
  resources :caregivers do
    member do
      get 'confirm_delete'
    end
  end
  get '/u/caregivers', to: 'caregivers#index_user', as: :index_user_caregiver
  post 'u/caregivers/:id/request', to: 'caregivers#solicitar'
  get 'u/caregivers/:id/request', to: 'caregivers#solicitar', as: :solicitar_cuidador
  post 'u/caregivers/:id/report', to: 'caregivers#reportar'
  get 'u/caregivers/:id/report', to: 'caregivers#reportar', as: :reportar_cuidador

  resources :walkers do
    member do
      get 'confirm_delete'
    end
  end
  get '/u/walkers', to: 'walkers#index_user', as: :index_user_walker
  post 'u/walkers/:id/request', to: 'walkers#solicitar'
  get 'u/walkers/:id/request', to: 'walkers#solicitar', as: :solicitar_paseador
  post 'u/walkers/:id/report', to: 'walkers#reportar'
  get 'u/walkers/:id/report', to: 'walkers#reportar', as: :reportar_paseador

  resources :medical_story do
    member do
      get 'confirm_delete'
    end
  end

  resources :health_record do
    member do
      get 'confirm_delete'
    end
  end

  # Rutas turnos "Santi"

  resources :appointments do
    member do
      get 'confirm_delete'
    end
  end

  patch 'appointments/:id/confirm_user_edit', to: 'appointments#confirm_user_edit', as: 'confirm_user_edit'

  patch 'appointments/:id/confirm_admin_edit', to: 'appointments#confirm_admin_edit', as: 'confirm_admin_edit'

  patch 'confirmed/:id/remove_cancel', to: 'appointments#remove_cancel', as: 'remove_cancel'

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get '/:id/confirm_cancel', to: 'appointments#confirm_cancel', as: :confirm_cancel_appointment
  get '/:id/edit', to: 'appointments#edit', as: :edit__appointment

  get '/requests', to: 'appointments#index_requests', as: :requests
  get '/requests/:id', to: 'appointments#show_request', as: :request

  get '/confirmed', to: 'appointments#index_confirmed', as: :confirmed
  get '/confirmed/:id', to: 'appointments#show_confirmed', as: :confirmed_show


  resources :adoptions do
    member do
      patch 'confirm'
      get 'confirm_delete'
    end
  end

  post 'adoption/:id/request', to: 'adoptions#solicitar'
  get 'adoption/:id/request', to: 'adoptions#solicitar', as: :solicitar

  resources :missing_posts do
    member do
      patch 'confirm'
      get 'confirm_delete'
    end
  end

  post 'missing_post/:id/request', to: 'missing_posts#solicitar'
  get 'missing_post/:id/request', to: 'missing_posts#solicitar', as: :mp_solicitar

end
