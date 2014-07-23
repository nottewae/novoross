class AjaxController < ApplicationController
  def login
    admin=Admin.new.auth(admin_params[:email],admin_params[:password])
    if admin
      session[:admin]=admin.id
      render json:{is_admin:true,email:admin.email,new_aut:form_authenticity_token}
    else
      render json:{is_admin:false,email:nil,new_aut:form_authenticity_token}
    end

  end

  def logout
    reset_session
    render json:{result:"session reset",new_aut:form_authenticity_token}
  end

  def edit_post
    @admin=Admin.find session[:admin]
    blog=Blog.find params[:id]
    if blog.update_attributes(post_params)
      render json:blog
    else
      render json:{id:nil}
    end

  end
  def update
    @admin=Admin.find session[:admin]
    blog=Blog.find post_params[:blog_id]
    post_params[:blog_id]=nil
    if blog.update_attributes(post_params)
      render json:blog
    else
      render json:{id:nil}
    end
  end

  def delete_post
    @admin=Admin.find session[:admin]
    @blog=Blog.find params[:id]
    if @blog.destroy
      render json:{result:true}
    else
      render json:{result:true}
    end

  end

  def create_post
    @admin=Admin.find session[:admin]
    post=Blog.new post_params
    if post.save
      render json:post
    else
      render json:{id:nil}
    end
  end
  def add_photo

    @admin=Admin.find session[:admin]

    @blog=Blog.new
    @blogs=Blog.all

    @image=Image.new image_params
    if @image.save

    else
      redirect_to root_path

    end
  end
  def delete_image
    @admin=Admin.find session[:admin]
    image = Image.find params[:id]
    if image.destroy
      render json:{result:true}
    else
      render json:{result:false}
    end

  end
  def get_post

  end

  private
  def image_params
    params.require(:image).permit(:blog_id,:image)
  end
  def admin_params
    params.require(:admin).permit(:email,:password)
  end
  def post_params
    params.require(:blog).permit(:title,:prev_text,:text,:blog_id)
  end

end
