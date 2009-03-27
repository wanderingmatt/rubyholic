# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  require 'will_paginate'
  
  before_filter :geocode_ip
  before_filter :show_only_upcoming
  
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
    case request.remote_ip
    when '127.0.0.1', /192\.168.*/
      @ip_location = { :latitude => '47.5798527', :longitude => '-122.1456091'}
      # @ip_location = { :latitude => '32.224015', :longitude => '-110.766919'}
    else
      raw_location = GEOIPDB.city request.remote_ip
      @ip_location = { :latitude => raw_location[9], :longitude => raw_location[10] }
    end
  end
  
  def show_only_upcoming
    session[:upcoming] ||= 'true' 
  end

  # Redirects the User to index and displays a flash message if one was provided
  def redirect_to_index message = nil
    flash[:notice] = message if message
    redirect_to :action => 'index'
  end

  def set_referer_cookie
    if request.env['HTTP_REFERER']
      cookies[:http_referer] = { :value => request.env['HTTP_REFERER'], :expires => 2.hours.from_now }
    end
  end
  
  # If a parameter has already been added to the URL for group or location, append that paramter with a &, otherwise use a ? to start the params hash
  def append_object_id(referer, controller, id)
    if referer.to_s =~ %r{\?(group|location)}
      referer += "&#{controller}=#{id}"
    else
      referer += "?#{controller}=#{id}"
    end
  end
end
