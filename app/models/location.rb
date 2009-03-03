class Location < ActiveRecord::Base
  has_many :events
  has_many :groups, :through => :locations
  
  validates_presence_of :name, :address
end
