class Admin::ServiceHooksController < Admin::ApplicationController
  before_filter :require_user
  before_filter "set_current_tab('admin/service_hooks')", :only => [ :index ]

  # GET /service_hooks
  #----------------------------------------------------------------------------
  def index
    @service_hooks = Setting[:service_hooks] ||= {}

    respond_to do |format|
      format.html # index.html.haml
    end
  end

  # PUT /service_hooks
  #----------------------------------------------------------------------------
  def update
    Setting[:service_hooks] = params[:service_hooks]
    flash[:notice] = 'Service Hooks saved'

    respond_to do |format|
      format.js # update.js.rjs
    end
  end
end

