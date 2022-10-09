class BlogsController < ApplicationController

  def index
    @blogs = Blog.all
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(params_blog)
    @blog.user = current_user
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
    @blog = blog.new(params_blog)
    @blog.user = current_user
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
    if @blog.update(params_blog)
      redirect_to blogs_path, notice: "ブログを編集しました。"
    else
      render :edit
    end
  end

  private

  def params_blog
    params.require(:blog).permit(:title, :content, :image, :image_cache )
  end

end
