class Event < ActiveRecord::Base
  named_scope :upcoming, :conditions => ["start_time > ?", Time.now]
  
  belongs_to :group
  belongs_to :location
  
  validates_presence_of :group_id, :location_id, :start_time, :end_time
  
  def self.sort(page, order)
    self.upcoming.paginate({ :page => page, :per_page => 10, :order => order, :include => ['group', 'location'] })
  end
  
  def self.pretty_time(time)
    time.strftime("%a %d %h, %Y at %I:%M %p")
  end
end
