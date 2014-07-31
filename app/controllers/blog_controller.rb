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
    @contacts=Contact.all.order('created_at DESC')
  end
  def create_contact
    @contact=Contact.new contact_params
    if @contact.save
      render json:{result:true,data:@contact}
    else
      render json:{result:false,data:@contact.errors}
    end
  end
  def destroy_contact
    @contact=Contact.find params[:id]
    @contact.destroy
    render json:{result:true}
  end
  private
  def contact_params
    params.require(:contact).permit(:title,:text)
  end
end
