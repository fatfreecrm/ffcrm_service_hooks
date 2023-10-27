module FatFreeCRM
  module ServiceHooks
    class Engine < Rails::Engine

      config.to_prepare do
        tab_urls = FatFreeCRM::Tabs.admin.map{|tab| tab[:url]}.map{|url| url[:controller]}
        unless tab_urls.include? 'admin/service_hooks'
          FatFreeCRM::Tabs.admin << {url: { controller: "admin/service_hooks" }, text: "Service Hooks", icon: 'fa-bullhorn'}
        end
      end

    end
  end
end
