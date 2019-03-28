require 'byebug'

class CommentsController < ApplicationController
  def index
    comments = Comment.all
    
    if params[:comment]
      if params[:comment][:user_id]
        user_id = params[:comment][:user_id]
        comments = comments.where(user_id: user_id)
      elsif params[:comment][:artwork_id]
        artwork_id = params[:comment][:artwork_id]
        comments = comments.where(artwork_id: artwork_id)
      end
    end
    
    render json: comments
  end

  def create
  end

  def destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:user_id, :artwork_id)
  end
end