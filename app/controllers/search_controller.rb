class SearchController < ApplicationController
  layout 'default'

  # GET /searches
  # GET /searches.xml  
  def index
    @query = params[:q]

    @search = Event.search(
      (@query || ""), 
      :page => (params[:page] || 1),
      :per_page => 10,
      :geo => [
        degrees_to_radians(@ip_location[:latitude].to_f),
        degrees_to_radians(@ip_location[:longitude].to_f)
      ],
      # :latitude_attr => @ip_location[:latitude],
      # :longitude_attr => @ip_location[:longitude],
      # :with => { "@geodist" => 0.0..80467.2 }, # 50 miles, in meters
      :without => { :start_time => 35.years.ago..Time.now }, # A little hard-coded, but it works well enough for now.
      :order => "date ASC, @geodist ASC"
    )
    
    @groups = Group.search(@query || "")
    @locations = Location.search(
      @query || "",
      :geo => [
        @ip_location[:latitude].to_f,
        @ip_location[:longitude].to_f
      ],
      # :with => { "@geodist" => 0.0..10.0 },
      :order => "@geodist ASC"
    )
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @search }
    end
  end
  
  private
  def degrees_to_radians(degree) 
    degree * Math::PI / 180 
  end
end