class BlogController < ApplicationController
  def index
    if session[:admin]
      @admin=Admin.find session[:admin]

    end
    @blog=Blog.new
    @blogs=Blog.all.order('created_at DESC')
  end
  def contacts
    if session[:admin]
      @admin=Admin.find session[:admin]
    end
    @blog=Blog.new
    @blogs=Blog.all.order('created_at DESC')
    @contact=Contact.new
    @contacts=Contact.all
  end
end
