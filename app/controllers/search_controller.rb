class SearchController < ApplicationController
  # GET /searches
  # GET /searches.xml

  layout 'application'
  
  def index
    @query = params[:q].nil? ? "" : params[:q]
    
    # @search = ThinkingSphinx::Search.search(
    @search = Event.search(
      @query, :page => (params[:page] || 1)
    )
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @search }
    end
  end


  #   if !params[:q].nil?
  #     @query = params[:q]
  #   end
  #   
  #   page = params[:page] || 1
  #   
  #   if params[:q] && !params[:q].nil?
  #     @search = ThinkingSphinx::Search.search(
  #     # @search = Group.search(
  #       @query, :page => (params[:page] || 1), :sort_by => "@relevance DESC, created_at DESC"
  #     )
  #   else
  #     @search = Group.all
  #   end
  # end
  
  # def self.search(search, page)
  #   paginate :per_page => 5, :page => page, :conditions => ['name like ?', "%#{search}%"], :order => 'name'
  # end
end