Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :ctsm_homes do
    resources :ctsm_homes, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :ctsm_homes, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :ctsm_homes, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
