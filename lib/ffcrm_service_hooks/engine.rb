module ::FatFreeCrmServiceHooks
  class Engine < Rails::Engine
    initializer "ffcrm_service_hooks.boot",
      :after => "ffcrm_merge.boot" do
        'ffcrm_service_hooks/contact'
    end

    config.to_prepare do
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
