class BlogsController < ApplicationController
  def show
    @blog=Blog.find params[:id]
    if session[:admin]
      @admin=Admin.find session[:admin]
    end
  end
end
