class SearchController < ApplicationController
  # GET /searches
  # GET /searches.xml

  layout 'application'
  
  def index    
    @query = params[:q].strip

    page = params[:page] || 1
    
    @search = Group.search(
      @query, (params[:search] || ""), :page => (params[:page] || 1)
    )

    # @search = Group.search(
    #   @query, (params[:search] || ""), :page => (params[:page] || 1)
    # )

    # @search = Group.search(
    #   @query, :page => (params[:page] || 1)
    # )

    # respond_to do |format|
    #   format.html # index.html.erb
    #   format.xml { render :xml => @search }
    # end
  end
  
  def self.search(search, page)
      paginate :per_page => 5, :page => page, :conditions => ['name like ?', "%#{search}%"], :order => 'name'
  end
end