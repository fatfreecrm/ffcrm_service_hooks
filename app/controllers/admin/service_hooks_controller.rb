class Admin::ServiceHooksController < Admin::ApplicationController
  before_filter :require_user
  before_filter "set_current_tab('admin/service_hooks')", :only => [ :index ]

  # GET /service_hooks
  #----------------------------------------------------------------------------
  def index
    @service_hooks = Setting[:service_hooks] ||= {}
    @service_hooks_url = set_service_hooks_url
    respond_to do |format|
      format.html # index.html.haml
    end
  end

  # PUT /service_hooks
  #----------------------------------------------------------------------------
  def update
    Setting[:service_hooks] = params[:service_hooks]
    @service_hooks_url = set_service_hooks_url
    flash[:notice] = 'Service Hooks saved'

    respond_to do |format|
      format.js # update.js.rjs
    end
  end

protected

  def set_service_hooks_url
    if Setting[:service_hooks][:merge_url].blank?
      "Undefined - please enter details above"
    else
      "POST #{Setting[:service_hooks][:merge_url]}" +
      (Setting[:service_hooks][:api_token].blank? ? '' : "?api_token=#{Setting[:service_hooks][:api_token]}")
    end
  end

end
