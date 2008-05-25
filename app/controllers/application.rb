# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time
  
  include AuthenticatedSystem
  
  # Use our standard layout for all non-AJAX/non-RSS-feed requests
  layout proc {|c| (c.request.xhr? || c.request.format.to_s.include?("xml")) ? false : "standard-layout" }

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '94fa89be11c98e20c6bf5f7b705d8c9c'
end
