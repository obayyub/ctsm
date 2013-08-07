Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :abouts do
    resources :abouts, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :abouts, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :abouts, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
