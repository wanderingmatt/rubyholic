class GroupsController < ApplicationController
  layout 'default'
  
  # GET /groups
  # GET /groups.xml
  def index
    @groups = Group.find(:all)
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @groups }
    end
  end

  # GET /groups/1
  # GET /groups/1.xml
  def show
    begin
      @group = Group.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid group #{params[:id]}")
      redirect_to_index('Invalid group')
    else
      respond_to do |format|
        format.html # show.html.erb
        format.xml  { render :xml => @group }
      end
    end
  end

  # GET /groups/new
  # GET /groups/new.xml
  def new
    @group = Group.new

    # Set a cookie to carry the user back to where they came from after creating the new group
    set_referer_cookie
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @group }
    end
  end

  # GET /groups/1/edit
  def edit
    begin
      @group = Group.find(params[:id])
    rescue ActiveRecord::RecordNotFound
      logger.error("Attempt to access invalid group #{params[:id]}")
      redirect_to_index('Invalid group')
    end
  end

  # POST /groups
  # POST /groups.xml
  def create
    @group = Group.new(params[:group])
    return_location = cookies[:http_referer]

    respond_to do |format|
      if @group.save
        flash[:notice] = 'Group was successfully created.'
        format.html { redirect_to return_location.blank? ? @group : append_object_id(return_location, "group", @group.id.to_i) }
        format.xml  { render :xml => @group, :status => :created, :location => @group }
        cookies.delete [:http_referer]
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /groups/1
  # PUT /groups/1.xml
  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        flash[:notice] = 'Group was successfully updated.'
        format.html { redirect_to(@group) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /groups/1
  # DELETE /groups/1.xml
  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to(groups_url) }
      format.xml  { head :ok }
    end
  end
end
