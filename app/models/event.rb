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
      self.upcoming.find_within(SEARCH_RADIUS, :origin => location.to_a.map { |a, b| b }).paginate({ :page => page, :per_page => 10, :order => order, :include => ['group', 'location'] })
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
    indexes description
    
    has group_id, location_id
  end
end
