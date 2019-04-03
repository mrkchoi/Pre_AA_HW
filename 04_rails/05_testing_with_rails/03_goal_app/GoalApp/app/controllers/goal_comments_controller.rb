class GoalCommentsController < ApplicationController
  def create
    @goal_comment = GoalComment.new(goal_comment_params)
    @goal_comment.author_id = current_user.id
    goal_author = Goal.find_by(id: params[:goal_comment][:goal_id]).user.id

    if @goal_comment.save
      redirect_to user_goal_url(goal_author, params[:goal_comment][:goal_id])
    else
      flash[:errors] = @goal_comment.errors.full_messages
      redirect_to user_goal_url(goal_author, params[:goal_comment][:goal_id])
    end
  end

  private

  def goal_comment_params
    params.require(:goal_comment).permit(:author_id, :goal_id, :content)
  end
end