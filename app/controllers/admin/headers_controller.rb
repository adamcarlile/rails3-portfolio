class Admin::HeadersController < Admin::BaseController
  inherit_resources
  respond_to :html
  
  def create
    create!{ collection_url }
  end
  
  def update
    update!{ collection_url }
  end
  
  def destroy
    destroy!{ collection_url }
  end
  
  
end
