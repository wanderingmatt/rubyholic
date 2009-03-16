class Event < ActiveRecord::Base
  named_scope :upcoming, :conditions => ["start_time > ?", Time.now]
  
  belongs_to :group
  belongs_to :location
  
  validates_presence_of :group_id, :location_id, :start_time, :end_time
  
  def self.sort(page, order, upcoming = 'true')
    if upcoming == 'true'
      self.upcoming.paginate({ :page => page, :per_page => 10, :order => order, :include => ['group', 'location'] })
    else
      paginate({ :page => page, :per_page => 10, :order => order, :include => ['group', 'location'] })
    end
  end
  
  def self.pretty_time(time)
    time.strftime("%a %d %h, %Y at %I:%M %p")
  end
  
  define_index do
    indexes description
    
    has group_id, location_id
  end
end
