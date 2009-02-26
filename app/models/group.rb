class Group < ActiveRecord::Base
  has_many :events
  has_many :locations, :through => :events
  
  validates_presence_of :name, :location_id
  
  def self.sort(page, order)
    paginate({ :page => page, :per_page => 10, :order => order, :include => ['location'] })
  end
end
