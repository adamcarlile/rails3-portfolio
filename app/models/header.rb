class Header < ActiveRecord::Base
  belongs_to :picture
  
  def lat_lng
    "#{lat},#{lng}"
  end
  
end
