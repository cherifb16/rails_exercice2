class BlogsController < ApplicationController
  before_action :set_blog, only: [:show, :edit, :update, :destroy]
  def index
    @blogs = Blog.all.order("updated_at desc")
  end

  def new
    @blog = Blog.new
  end


  def confirm
    @blog = Blog.new(blog_params)
    render :new if @blog.invalid?
  end

  def create
    @blog = Blog.new(blog_params)
    if params[:name]
      render :new
    else
      if @blog.save
        redirect_to blogs_path, notice: "Nous avons créé un blog !"
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @blog.update(blog_params)
      redirect_to blogs_path, notice: "Le blog a été édité !"
    else
      render :edit
    end
  end

  def show
  end

  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: "Le blog a été supprimé !"
  end

  private
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  def set_blog
    @blog = Blog.find(params[:id])
  end

end