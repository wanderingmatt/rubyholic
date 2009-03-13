class SearchController < ApplicationController
  # GET /searches
  # GET /searches.xml

  layout 'events'
  
  def index    
    if !params[:q].nil?
      @query = params[:q].strip
    end
    
    page = params[:page] || 1
    
    if params[:q]
      @search = Group.search(
        @query, :page => (params[:page] || 1)
      )
    else
      @search = Group.all
    end
  end
  
  def self.search(search, page)
    paginate :per_page => 5, :page => page, :conditions => ['name like ?', "%#{search}%"], :order => 'name'
  end
end