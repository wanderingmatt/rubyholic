class SearchController < ApplicationController
  # GET /searches
  # GET /searches.xml

  layout 'application'
  
  def index
    @query = params[:q]
    
    if @query
      @search = Event.search(
        (@query || ""), 
        :page => (params[:page] || 1),
        :per_page => 10,
        :geo => [
          degrees_to_radians(params[:lat].to_f),
          degrees_to_radians(params[:lon].to_f)
        ],
        :order => :date,
        :without => { :start_time => 35.years.ago..Time.now } # A little hard-coded, but it works well enough for now.
      )
      
      @groups = Group.search(@query)
      @locations = Location.search(@query)
    else
      @search = Event.search("", :page => (params[:page] || 1))
      @groups = Group.search
      @location = Location.search
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @search }
    end
  end
  
  private
  def degrees_to_radians(degree)
    degree = Math::PI / 180
  end
  
  def create_map(location, zoom = 15)
    @map = GMap.new('map')
    @map.control_init(:large_map_3d => true,:map_type => true, :scale => true)
    @map.center_zoom_init([location[:latitude],location[:longitude]],zoom)
    @map.add_map_type_init(GMapType::G_PHYSICAL_MAP)
    @map.set_map_type_init(GMapType::G_PHYSICAL_MAP)
    get_upcoming_markers.each do |marker|
      @map.record_init @map.add_overlay(marker)
    end
  end
end