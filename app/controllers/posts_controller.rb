class PostsController < ApplicationController
  inherit_resources
  actions :index, :show
  respond_to :html, :xml
end
