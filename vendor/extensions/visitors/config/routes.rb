Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :visitors do
    resources :visitors, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :visitors, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :visitors, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
