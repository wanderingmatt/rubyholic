class LocationsController < ApplicationController  
  # GET /locations
  # GET /locations.xml
  def index
    @title = 'Locations'
    
    @locations = Location.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    begin
      @location = Location.find(params[:id])
      create_map @location
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid group #{params[:id]}")
      redirect_to_index('Invalid group')
    else    
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @location }
      end
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    @location = Location.new

    # Set a cookie to carry the user back to where they came from after creating the new group
    set_referer_cookie

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @location }
    end
  end

  # GET /locations/1/edit
  def edit
    begin
      @location = Location.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid group #{params[:id]}")
      redirect_to_index('Invalid group')
    end
  end

  # POST /locations
  # POST /locations.xml
  def create
    @location = Location.new(params[:location])

    return_location = cookies[:http_referer]

    respond_to do |format|
      if @location.save
        flash[:notice] = 'Location was successfully created.'
        format.html { redirect_to return_location.blank? ? @location : append_object_id(return_location, "location", @location.id.to_i) }
        format.xml  { render :xml => @location, :status => :created, :location => @location }
        cookies.delete [:http_referer]
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @location = Location.find(params[:id])

    respond_to do |format|
      if @location.update_attributes(params[:location])
        flash[:notice] = 'Location was successfully updated.'
        format.html { redirect_to(@location) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @location.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @location = Location.find(params[:id])
    @location.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end
  
  private
  
  def create_map(location)
    position = [location.latitude,location.longitude]
    @map = GMap.new('map')
    @map.control_init(:large_map_3d => true,:map_type => true, :scale => true)
    @map.center_zoom_init(position,17)
    @map.add_map_type_init(GMapType::G_PHYSICAL_MAP)
    @map.set_map_type_init(GMapType::G_HYBRID_MAP)
    @map.overlay_init(GMarker.new(position, :info_window => "<div>#{location.name}</div><div>#{location.address}</div>"))
  end
end
