class UserCommentsController < ApplicationController
  def create
    @user_comment = UserComment.new(user_comments_params)
    @user_comment.author_id = current_user.id

    if @user_comment.save
      redirect_to user_url(params[:user_comment][:user_id])
    else
      flash[:errors] = @user_comment.errors.full_messages
      redirect_to user_url(params[:user_comment][:user_id])
      # fail
    end

  end

  private

  def user_comments_params
    params.require(:user_comment).permit(:content, :author_id, :user_id)
  end
end