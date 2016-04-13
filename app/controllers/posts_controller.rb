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
    @post = current_user.posts.find(params["id"])
    @post.update(title: params["title"],
                content: params["content"])
    redirect_to :root
  end

  def show
    @post = Post.find(params["id"])
    render :show
  end

  def delete
    @post = Post.find(params["id"])
    comments = Comment.where(post_id: @post.id)
    comments.each do |comment|
      comment.destroy
    end
    @post.destroy
    redirect_to :root
  end
end
