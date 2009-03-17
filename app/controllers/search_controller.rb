class SearchController < ApplicationController
  # GET /searches
  # GET /searches.xml

  layout 'application'
  
  def index
    @query = params[:q]
    
    if @query
      @search = Event.search(
        (@query || ""), :page => (params[:page] || 1)
      )
    else
      @search = Event.search("", :page => (params[:page] || 1))
    end
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @search }
    end
  end
end