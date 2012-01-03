Contact.class_eval do
  def merge_with_with_service_hook(master, ignored_attr = {})
    if merge_with_without_service_hook(master, ignored_attr)
      merge_url = (Setting[:service_hooks] || {})["merge_url"]
      api_token = (Setting[:service_hooks] || {})["api_token"]
      if merge_url
        params = {:format => :form,
                  :merge => {
                    :old_contact => {:id => self.id},
                    :new_contact => {:id => master.id, :name => master.name}
                  },
                 }
        params.merge!(:api_token => api_token) if api_token.present?
        Rails.logger.info "Contact merge service hook: POST data to #{merge_url}..."
        Rails.logger.debug "Params: #{params.to_s}"
        begin
          Nestful.post merge_url, params
        rescue Exception => ex
          Rails.logger.error "POST failed! #{ex.message}"
        end
      else
        Rails.logger.info "No merge_url defined in settings. Ignoring merge..."
      end
      true
    end
  end

  alias_method_chain :merge_with, :service_hook
end

