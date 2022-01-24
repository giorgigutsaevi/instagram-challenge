class PostsController < ApplicationController


  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.new
  end

  def create
    @post = current_user.posts.new(post_params)
    @post.save
    if @post.save
      redirect_to posts_url
    else
      flash[:error] = @post.error.full_messages
      redirect_to new_post_path(@post)
    end
  end

  private 
  def post_params
    params.require(:post).permit(:title, :body, :image, :user_id)
  end
end
