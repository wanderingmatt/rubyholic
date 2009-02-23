class Group < ActiveRecord::Base
  belongs_to :location
  
  validates_presence_of :name, :location_id
end
