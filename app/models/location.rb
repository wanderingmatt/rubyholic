class Location < ActiveRecord::Base
  has_many :groups
  
  validates_presence_of :name
end
