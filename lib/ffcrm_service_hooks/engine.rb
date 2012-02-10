module FatFreeCRM::ServiceHooks
  class Engine < Rails::Engine
    config.to_prepare do
      require 'ffcrm_service_hooks/contact'
    
      if FatFreeCRM::Tabs.admin.present?

        FatFreeCRM::Tabs.admin << {
          :text => "Service Hooks",
          :url => { :controller => "admin/service_hooks" }
        }

        if Setting[:service_hooks].blank?
          puts "Please configure your service hook settings on the admin tab."
        end
      end
    end
  end
end
