class Event < ActiveRecord::Base
  named_scope :upcoming, :conditions => ["start_time > ?", Time.now]
  
  belongs_to :group
  belongs_to :location
  acts_as_mappable :through => :location
  
  validates_presence_of :group_id, :location_id, :start_time, :end_time
  
  SEARCH_RADIUS = 50 # miles

  # TODO: Make this less redundant. It would be easier if upcoming could be called after paginate.
  def self.sort(page, order, upcoming = 'true', location = nil)
    if upcoming == 'true' && !location.nil?
      self.upcoming.find_within(SEARCH_RADIUS, :origin => [location[:latitude],location[:longitude]]).paginate({ :page => page, :per_page => 10, :order => order, :include => ['group', 'location'] })
    elsif upcoming == 'true' && location.nil?
      self.upcoming.paginate({ :page => page, :per_page => 10, :order => order, :include => ['group', 'location'] })
    else
      self.paginate({ :page => page, :per_page => 10, :order => order, :include => ['group', 'location'] })
    end
  end
  
  def self.pretty_time(time)
    time.strftime("%a %d %h, %Y at %I:%M %p")
  end
  
  define_index do
    indexes description, :sortable => true
    indexes start_time, :as => :date, :sortable => true
    indexes group_id, location_id
    indexes group.name, :as => :group, :sortable => true
    indexes location.name, :as => :location, :sortable => true
    indexes location.address, :as => :location_address, :sortable => true
    
    has group_id, location_id, end_time, location.latitude, location.longitude
    
    set_property :enable_star => 1
    set_property :min_infix_len => 2
  end
end
