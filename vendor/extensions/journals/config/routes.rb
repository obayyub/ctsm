Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :journals do
    resources :journals, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :journals, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :journals, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
