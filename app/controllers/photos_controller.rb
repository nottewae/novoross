class PhotosController < ApplicationController
  def index
    @blog=Blog.new
    if session[:admin]
      @admin=Admin.find session[:admin]
    end
    @photos=Image.all
  end
end
