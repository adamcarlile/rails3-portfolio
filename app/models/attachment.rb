class Attachment < ActiveRecord::Base
  belongs_to :attachable, :polymorphic => true  
  belongs_to :asset
end
