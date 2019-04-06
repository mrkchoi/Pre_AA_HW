class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post_id = params[:post_id]
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    @comment.post_id = params[:comment][:post_id]
    
    # fail
    if @comment.save
      redirect_to post_url(params[:comment][:post_id])
    else
      flash.now[:errors] = @comment.errors.full_messages
      render post_url(params[:comment][:post_id])
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id)
  end
end