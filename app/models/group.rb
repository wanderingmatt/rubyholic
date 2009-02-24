class Group < ActiveRecord::Base
  belongs_to :location
  
  validates_presence_of :name, :location_id
  
  def self.sort(page, order)
    options = {}
    
    if order == 'location'
      options[:order] = 'location_id'
    else order == 'name'
      options[:order] = 'name'
    end
    
    paginate({ :page => page, :per_page => 10 }.merge options)
  end
end
