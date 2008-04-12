# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  session :session_key => '_bookq_session_id'
  include AuthenticatedSystem
  
  # Request from an iPhone or iPod touch? (Mobile Safari user agent)
  def iphone_user_agent?
    request.env["HTTP_USER_AGENT"] && request.env["HTTP_USER_AGENT"][/(Mobile\/.+Safari)/]
  end
  
end
