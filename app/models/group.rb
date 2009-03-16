class Group < ActiveRecord::Base
  has_many :events
  has_many :locations, :through => :events
  
  validates_presence_of :name
  
  define_index do
    indexes :name, :sortable => true
    
    has updated_at
  end
end
