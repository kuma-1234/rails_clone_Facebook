class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = current_user.blogs.build(blog_params)
    if params[:back]
      render :new
    else
      if @blog.save
        flash[notice] = "投稿の作成をしました！"
        redirect_to new_blog_path
      else
        render :new
      end
    end
  end

  def confirm
    @blog = current_user.blogs.build(blog_params)
    render :new if @blog.invalid?
  end

  def show
    @blog = Blog.find(params[:id])
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "ブログを編集しました。"
    else
      render :edit
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path, notice: "ブログを削除しました！"
  end

  
  private

  def blog_params
    params.require(:blog).permit(:title, :content, :user_id, :image, :image_cache )
  end

end
