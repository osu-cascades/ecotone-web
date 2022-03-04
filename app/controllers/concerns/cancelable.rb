module Cancelable
  extend ActiveSupport::Concern

	included do
		before_action :redirect_cancel, :only => [:create, :update]
	end

	def redirect_cancel
		redirect_to request.env['PATH_INFO'] if params[:cancel]
	end

end