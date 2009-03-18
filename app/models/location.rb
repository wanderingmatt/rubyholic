class Location < ActiveRecord::Base
  acts_as_mappable :auto_geocode => true, :lat_column_name => 'latitude', :lng_column_name => 'longitude'

  has_many :events
  has_many :groups, :through => :events
  
  validates_presence_of :name, :address
  
  define_index do
    indexes name, :sortable => true
    indexes address, :sortable => true
    
    set_property :enable_star => 1
    set_property :min_infix_len => 2
  end
end
