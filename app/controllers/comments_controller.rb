class CommentsController < ApplicationController
  def create
    @post = Post.find(params["id"])
    new_comment = @post.comments.create(body: params["body"],
                                        post_id: @post.id,
                                        user_id: current_user.id)
    redirect_to posts_display_path(params["id"])
  end

  # def edit
  #   @comment = Comment.find(params["id"])
  #   render :edit, locals: {comment: @comment}
  # end
  #
  # def update
  #   @comment = Comment.find(params["id"])
  #   @comment.update(body: params["body"])
  #   redirect_to posts_display_path(params["post_id"])
  # end
  #
  def delete
    @comment = Comment.find(params["id"])
    post_id = @comment.post_id
    @comment.destroy
    redirect_to posts_display_path(post_id)
  end
end
