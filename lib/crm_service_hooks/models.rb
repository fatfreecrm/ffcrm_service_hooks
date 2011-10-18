Contact.class_eval do
  def merge_with_with_service_hook(master, ignored_attr = {})
    if merge_with_without_service_hook(master, ignored_attr = {})
      if merge_url = (Setting[:service_hooks] || {})["merge_url"]
        Rails.logger.info "Contact merge service hook: POST data to #{merge_url}..."
        begin
          Nestful.post merge_url, :format => :form,
                                  :params => {
                                    :merge => {
                                      :old_contact => {:id => self.id},
                                      :new_contact => {:id => master.id, :name => master.name}
                                    }
                                  }
        rescue Exception => ex
          Rails.logger.error "POST failed! #{ex.message}"
        end
      end
      true
    end
  end

  alias_method_chain :merge_with, :service_hook
end

