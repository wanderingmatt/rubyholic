class Search < ActiveRecord::Base
  def search_groups(q)
    query = q.nil? ? "" : q
    
    @groups = Group.search(query, :sort_by => "@relevance DESC, updated_at DESC")
  end
  
  def self.search_locations(q)
    query = q.nil? ? "" : q
    
    @locations = Location.search(query, :sort_by => "@relevance DESC, updated_at DESC")
  end
end
