class BlogController < ApplicationController
  def index
    if session[:admin]
      @admin=Admin.find session[:admin]
    else
      redirect_to root_path
    end
    @blog=Blog.new
    @blogs=Blog.all.order('created_at DESC')
  end
end
