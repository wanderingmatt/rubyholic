class Search < ActiveRecord::Base
  def self.search(search, page)
    paginate :per_page => 5, :page => page, :conditions => ['name like ?', "%#{search}%"], :order => 'name'
  end
end
