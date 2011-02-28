class Project < ActiveRecord::Base
  has_many :attachments, :as => :attachable
  has_many :assets, :through => :attachments
    
  acts_as_taggable_on :tag
  
  before_save :setup_slug
  
  #Require AdamCarlile Libraries
  include AC
  
  def to_s
    title
  end
  
  def setup_slug
    self.slug = self.to_slug
  end
  
  def to_param
    "#{id}-#{self.to_slug}"
  end
  
end
