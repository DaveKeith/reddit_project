class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index, locals: { posts: @posts }
  end

  def new
    render :new
  end

  def create
    new_post = Post.create(title: params["title"],
                           content: params["content"])
    redirect_to :root
  end

  def edit
    @post = Post.find(params["id"])
    render :edit, locals: {post: @post}
  end

  def update
    @post = Post.find(params["id"])
    @post.update(title: params["title"],
                content: params["content"])
    redirect_to :root
  end

  def show
    @post = Post.find(params["id"])
    render :show
  end

  def delete
    @post = Post.destroy(params["id"])
    render :delete
  end
end