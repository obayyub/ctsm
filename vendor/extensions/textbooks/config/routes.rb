Refinery::Core::Engine.routes.append do

  # Frontend routes
  namespace :textbooks do
    resources :textbooks, :path => '', :only => [:index, :show]
  end

  # Admin routes
  namespace :textbooks, :path => '' do
    namespace :admin, :path => 'refinery' do
      resources :textbooks, :except => :show do
        collection do
          post :update_positions
        end
      end
    end
  end

end
