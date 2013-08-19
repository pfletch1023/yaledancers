class Performance < ActiveRecord::Base
  
  attr_accessible :start_at, :end_at, :show_id
  
  belongs_to :show
  
  validates_presence_of :show_id, :start_at, :end_at
  
end
