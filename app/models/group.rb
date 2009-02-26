class Group < ActiveRecord::Base
  has_many :events
  has_many :locations, :through => :events
  
  validates_presence_of :name
  
  def self.sort(page, order)
    paginate({ :page => page, :per_page => 10, :order => order })
  end
end
