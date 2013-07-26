Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :people do
    resources :people, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :people, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :people, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
