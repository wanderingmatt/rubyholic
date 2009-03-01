class Event < ActiveRecord::Base
  belongs_to :group
  belongs_to :location
  
  validates_presence_of :group_id, :location_id, :start_time, :end_time
  
  def self.sort(page, order)
    paginate({ :page => page, :per_page => 10, :order => order })
  end
end
