class Group < ActiveRecord::Base
  belongs_to :location
  
  validates_presence_of :name, :location_id
  
  def self.sort(page, order)    
    if order == 'location'
      paginate :page => page, :per_page => 10, :order => 'location_id'
    else order == 'name'
      paginate :page => page, :per_page => 10, :order => 'name'
    end
  end
end
