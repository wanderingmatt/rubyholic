class EventsController < ApplicationController
  layout 'default'
  # GET /events
  # GET /events.xml
  def index
    @events = Event.sort(params[:page], params[:sorted_by], session[:upcoming], @ip_location)
    create_map @ip_location, 10

    respond_to do |format|
      format.html { render :layout => 'mapped' }
      format.xml  { render :xml => @events }
    end    
  end

  # GET /events/1
  # GET /events/1.xml
  def show
    @event = Event.find(params[:id])
    create_map @event.location, 16, @event
    
    respond_to do |format|
      format.html { render :layout => 'mapped' }
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/new
  # GET /events/new.xml
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @event }
    end
  end

  # GET /events/1/edit
  def edit    
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.xml
  def create
    @event = Event.new(params[:event])
    cookies.delete :http_referer # get rid of that data so it doesn't cause any weirdness.

    respond_to do |format|
      if @event.save
        flash[:notice] = 'Event was successfully created.'
        format.html { redirect_to(@event) }
        format.xml  { render :xml => @event, :status => :created, :location => @event }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        format.html { redirect_to(@event) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end

  private
  
  def create_map(location, zoom = 15, event = nil)
    center = [location[:latitude].to_f, location[:longitude].to_f]
    # Offsets center unless we are viewing a single event
    center[1] -= 0.2 unless event
    @map = GMap.new('map')
    @map.control_init(:map_type => true, :scale => true)
    @map.control_init(:large_map_3d => true)
    @map.center_zoom_init(center, zoom)
    @map.add_map_type_init(GMapType::G_PHYSICAL_MAP)
    @map.set_map_type_init(GMapType::G_PHYSICAL_MAP)
    @map.interface_init(:continuous_zoom => true, :scroll_wheel_zoom => true)
    
    get_upcoming_markers.each { |marker| @map.record_init @map.add_overlay(marker) } if event.nil?
    
    @map.record_init @map.add_overlay(GMarker.new([event.location.latitude, event.location.longitude], :info_window => "<strong><a href=\"/groups/#{event.group.id}\">#{event.group.name}</a></strong><br /><a href=\"/locations/#{event.location.id}\">#{event.location.name}</a><br />#{Event.pretty_date(event.start_time)}")) unless event.nil?
  end
    
  def get_upcoming_markers
    markers = []
    Event.upcoming.each do |event|
      markers << GMarker.new([event.location.latitude, event.location.longitude], :info_window => "<strong><a href=\"/groups/#{event.group.id}\">#{event.group.name}</a></strong><br /><a href=\"/locations/#{event.location.id}\">#{event.location.name}</a><br />#{Event.pretty_date(event.start_time)}")
    end
    markers
  end

end
