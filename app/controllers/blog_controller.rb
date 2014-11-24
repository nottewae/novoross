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
    if session[:admin]
      @admin=Admin.find session[:admin]

    @contact=Contact.new contact_params
    if @contact.save
      render json:{result:true,data:@contact}
    else
      render json:{result:false,data:@contact.errors}
    end
    else
      render json:{result:"OOOps!"}
    end
  end
  def destroy_contact
    if session[:admin]
      @admin=Admin.find session[:admin]

    @contact=Contact.find params[:id]
    @contact.destroy
    render json:{result:true}
    else
      render json:{result:"OOOps!"}
    end
  end
  private
  def contact_params
    params.require(:contact).permit(:title,:text)
  end
end
