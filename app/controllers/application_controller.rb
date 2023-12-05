class ApplicationController < ActionController::Base
  before_action :basic_auth

 
  private

  def basic_auth
    authenticate_or_request_with_http_basic do |username, password|
      username == 'PAYJP_SECRET_KEY' && password == '4df29baf7d93d21bbe8404ad28712dad'
    end
  end
end