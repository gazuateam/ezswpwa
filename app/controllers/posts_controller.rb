class PostsController < ApplicationController
  # enable_sync only: [:create]

  def new
  end

  def create
    @post = Post.new
    @post.location = params[:location]
    @post.price = params[:price]
    @post.number = params[:number]
    @post.status = 0
    @post.buyer_id = "user1"
    @post.buyer_name = "user1"
    @post.seller_name = ""
    @post.save

    # sync_new @post

    redirect_to "/posts/index"
  end

  def index
    @posts = Post.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to "/posts/index"
    sync_destroy @post
  end

end
