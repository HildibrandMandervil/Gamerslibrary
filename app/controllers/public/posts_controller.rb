class Public::PostsController < ApplicationController
  before_action :is_matching_login_user, only: [:edit,:updata,:destroy]
  
  def show
    @post =Post.find(params[:id])
    @new_post=Post.new
    @user= @post.user
  end

  def index
    @posts = Post.all
    @new_post = Post.new

  end

  def edit
     @post=Post.find(params[:id])
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to post_path(@post.id)
  end

 def update
      post =Post.find(params[:id])
  if  post.update(post_params)
      flash[:notice] = "セーブしました."
      redirect_to post_path(post.id)
  else
      @post=post
      render :edit
  end
 end

 def destroy
      @posts=Post.all
      post=Post.find(params[:id])
      post.destroy
      redirect_to posts_path
 end

    private

  def post_params
    params.require(:post).permit(:title, :body, :image)
  end

  def is_matching_login_user
    post = Post.find(params[:id])
    unless post.user.id == current_user.id
      redirect_to root_path
    end
  end
end
