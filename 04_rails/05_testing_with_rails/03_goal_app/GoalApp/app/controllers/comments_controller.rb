class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    # fail
    if params[:goal_id]
      @comment.commentable_type = 'Goal'
      @comment.commentable_id = params[:goal_id]
    else
      @comment.commentable_type = 'User'
      @comment.commentable_id = params[:user_id]
    end
  
    # fail
    if @comment.save && @comment.commentable_type == 'User'
      redirect_to user_url(@comment.commentable_id)
    elsif @comment.save && @comment.commentable_type == 'Goal'
      redirect_to user_goal_url(params[:user_id], params[:goal_id])
    elsif @comment.commentable_type == 'User'
      flash[:errors] = @comment.errors.full_messages
      redirect_to user_url(@comment.commentable_id)
    else
      flash[:errors] = @comment.errors.full_messages
      redirect_to user_goal_url(params[:user_id], params[:goal_id])
    end

    # fail
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :commentable_id, :commentable_type, :author_id)
  end
end