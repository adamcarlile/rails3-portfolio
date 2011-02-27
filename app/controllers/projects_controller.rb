class ProjectsController < ApplicationController
  inherit_resources
  actions :index, :show
  respond_to :html, :xml

  def homepage
    @projects = Project.all
  end

end
