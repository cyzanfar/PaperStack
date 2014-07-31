module Commontator
  class ApplicationController < ActionController::Base
    cattr_reader :app_routes

    before_filter :get_user, :ensure_user, :set_app_routes
    
    rescue_from SecurityTransgression, :with => lambda { head(:forbidden) }
    
    protected

    def security_transgression_unless(check)
      raise SecurityTransgression unless check
    end

    def get_user
      @user = Commontator.current_user_proc.call(self)
    end

    def ensure_user
      security_transgression_unless(@user && @user.is_commontator)
    end

    def get_thread
      @thread = params[:thread_id].blank? ? \
        Commontator::Thread.find(params[:id]) : \
        Commontator::Thread.find(params[:thread_id])
      security_transgression_unless @thread.can_be_read_by? @user
    end

    def set_app_routes
      @@app_routes ||= main_app
    end
  end
end

