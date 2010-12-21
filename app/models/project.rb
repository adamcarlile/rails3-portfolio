class Project < ActiveRecord::Base
  has_many :attachments, :as => :attachable
  has_many :assets, :through => :attachments
end
