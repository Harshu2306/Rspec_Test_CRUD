class ApplicationController < ActionController::Base
skip_before_action :verify_authenticity_token	
  def send_response(status,status_code,message,result,meta={})
    render json:{
	  status: status,
	  message: message,
	  data: result,
	  meta: meta
	},status: status_code
  end
end
