class TagsController < ApplicationController
  
  def index
    find_options = {:limit => 100}
    unless params[:term].blank?
      find_options[:conditions] = ['name like ?', "%#{params[:term]}%"]
    end
    tags = Tag.all(find_options).sort_by(&:name)
    output = []
    tags.each do |t|
      output << {:value => t.name}
    end
    render :json => output
  end
  
end
