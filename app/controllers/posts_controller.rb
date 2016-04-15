class PostsController < ApplicationController
  def index
    @posts = Post.all
    render :index, locals: { posts: @posts }
  end

  def new
    render :new
  end

  def create
    new_post = current_user.posts.create(title: params["title"],
                           content: params["content"])
    redirect_to :root
  end

  def edit
    @post = Post.find(params["id"])
    render :edit, locals: {post: @post}
  end

  def update
    right_now = DateTime.now
    @post = Post.find(params["id"])
    @post.update(title: params["title"],
                content: params["content"])
    @post.updated_at = right_now
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
