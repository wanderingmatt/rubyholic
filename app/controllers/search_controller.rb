class SearchController < ApplicationController
  layout 'default'
  
  # GET /searches
  # GET /searches.xml  
  def index
    create_map @ip_location, 10
    @query = params[:q]

    @search = Event.search(
      (@query || ""), 
      :page => (params[:page] || 1),
      :per_page => 10,
      :geo => [
        degrees_to_radians(@ip_location[:latitude].to_f),
        degrees_to_radians(@ip_location[:longitude].to_f)
      ],
      # :with => { "@geodist" => 0.0..10.0 }, # not really sure how big a radius that is ...
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
  
  def create_map(location, zoom = 15)
    @map = GMap.new('map')
    @map.control_init(:large_map_3d => true,:map_type => true, :scale => true)
    @map.center_zoom_init([location[:latitude],location[:longitude]],zoom)
    @map.add_map_type_init(GMapType::G_PHYSICAL_MAP)
    @map.set_map_type_init(GMapType::G_PHYSICAL_MAP)
    # get_upcoming_markers.each do |marker|
    #   @map.record_init @map.add_overlay(marker)
    # end
  end

  def get_upcoming_markers
    markers = []
    Event.upcoming.each do |event|
      markers << GMarker.new([event.location.latitude, event.location.longitude], :info_window => "<div>#{event.group.name}</div><div>#{event.location.name}</div><div>#{Event.pretty_time(event.start_time)}</div>")
    end
    markers
  end
end