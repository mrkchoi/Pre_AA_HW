class CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @post_id = params[:post_id]
    render :new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.author_id = current_user.id
    if params[:comment][:post_id] != ''
      @comment.post_id = params[:comment][:post_id]
    else
      @comment.post_id = Comment.find(params[:comment_id]).post_id
      @comment.parent_comment_id = Comment.find(params[:comment_id]).id
    end
    # fail
    
    # fail
    if @comment.save && params[:comment][:post_id] != ''
      redirect_to post_url(params[:comment][:post_id])
    elsif @comment.valid?
      redirect_to comment_url(@comment.parent_comment_id)
    elsif params[:comment][:post_id] != ''
      flash.now[:errors] = @comment.errors.full_messages
      render post_url(params[:comment][:post_id])
    else
      flash.now[:errors] = @comment.errors.full_messages
      redirect_to comment_url(@comment.parent_comment_id)
    end
  end

  def show
    @comment = Comment.find_by(id: params[:id])
    render :show
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :author_id, :post_id)
  end
end