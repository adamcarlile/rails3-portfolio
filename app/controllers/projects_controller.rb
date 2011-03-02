class ProjectsController < ApplicationController
  inherit_resources
  actions :index, :show
  respond_to :html, :xml

  def homepage
    @projects = Project.all
    @posts = Tumblr.feed[0..1]
  end
  
  private
  
    def resource
      @project = Project.find_by_slug(params[:id])
    end
end
