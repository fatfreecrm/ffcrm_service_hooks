FatFreeCRM::Application.routes.draw do
  namespace :admin do
    resources :service_hooks, :only => :index do
      put :update, :on => :collection
    end
  end
end

