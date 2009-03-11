class SearchController < ApplicationController
  # GET /searches
  # GET /searches.xml

  layout 'events'
  
  def index
    # @searches = Search.find(:all)
    # @search = ThinkingSphinx::Search.new(
    #       (params[:search] || ""), :page => (params[:page] || 1)
    #     )
    
    @query = params[:q].strip
    
    page = params[:page] || 1
    
    @search = Group.search(
      @query, (params[:search] || ""), :page => (params[:page] || 1)
    )
  end
  
  def self.search(search, page)
    paginate :per_page => 5, :page => page, :conditions => ['name like ?', "%#{search}%"], :order => 'name'
  end
end
