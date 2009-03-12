# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  require 'will_paginate'
  
  before_filter :geocode_ip
  
  helper :all # include all helpers, all the time

  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery # :secret => '90f70f7218febb657f13aea021e61557'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  
  private
  
  
  def geocode_ip
    # TODO Raw array of location data. Needs to be refinded.
    @location = GEOIPDB.city request.env['REMOTE_HOST']
  end

  # Redirects the User to index and displays a flash message if one was provided
  def redirect_to_index message = nil
    flash[:notice] = message if message
    redirect_to :action => 'index'
  end
end
