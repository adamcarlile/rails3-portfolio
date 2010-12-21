class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :set_page_ivars
  layout 'public'
  
  def set_page_ivars
    @hero_image = Header.all.shuffle.first
  end
  
end
