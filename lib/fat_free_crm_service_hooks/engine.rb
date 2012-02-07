module ::FatFreeCrmServiceHooks
  class Engine < Rails::Engine
    config.to_prepare do
      if (Setting[:service_hooks].blank? rescue true)
        puts "Please configure your service hook settings in the admin screen."
      else
        require 'fat_free_crm_mingle/mingle_view_hooks'
        FatFreeCRM::Tabs.admin << {
          :text => "Service Hooks",
          :url => { :controller => "admin/service_hooks" }
        }
      end
    end
  end
end
