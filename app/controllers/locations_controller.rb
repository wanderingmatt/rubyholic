class LocationsController < ApplicationController
  # GET /locations
  # GET /locations.xml
  def index
    @locations = Locations.find(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1
  # GET /locations/1.xml
  def show
    @locations = Locations.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/new
  # GET /locations/new.xml
  def new
    @locations = Locations.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @locations }
    end
  end

  # GET /locations/1/edit
  def edit
    @locations = Locations.find(params[:id])
  end

  # POST /locations
  # POST /locations.xml
  def create
    @locations = Locations.new(params[:locations])

    respond_to do |format|
      if @locations.save
        flash[:notice] = 'Locations was successfully created.'
        format.html { redirect_to(@locations) }
        format.xml  { render :xml => @locations, :status => :created, :location => @locations }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @locations.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /locations/1
  # PUT /locations/1.xml
  def update
    @locations = Locations.find(params[:id])

    respond_to do |format|
      if @locations.update_attributes(params[:locations])
        flash[:notice] = 'Locations was successfully updated.'
        format.html { redirect_to(@locations) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @locations.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.xml
  def destroy
    @locations = Locations.find(params[:id])
    @locations.destroy

    respond_to do |format|
      format.html { redirect_to(locations_url) }
      format.xml  { head :ok }
    end
  end
end
