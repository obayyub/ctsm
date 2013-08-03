Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :carousels do
    resources :carousels, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :carousels, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :carousels, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
