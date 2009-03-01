class Group < ActiveRecord::Base
  has_many :events
  has_many :locations, :through => :events
  
  validates_presence_of :name
end
