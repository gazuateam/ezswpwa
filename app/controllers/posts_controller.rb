class PostsController < ApplicationController
  def new
  end

  def create
    post = Post.new
    post.location = params[:location]
    post.price = params[:price]
    post.number = params[:number]
    post.status = 0
    post.buyer_id = "user1"
    post.buyer_name = "user1"
    post.seller_name = ""
    post.save

    redirect_to "/posts/index"
  end

  def index
    @posts = Post.all
  end

end
