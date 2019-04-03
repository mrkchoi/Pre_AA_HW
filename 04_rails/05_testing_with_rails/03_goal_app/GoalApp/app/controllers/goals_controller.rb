class GoalsController < ApplicationController
  def new
    @goal = Goal.new
    render :new
  end

  def create
    @goal = Goal.new(goal_params)
    @goal.user_id = params[:user_id]

    # fail
    if @goal.save
      redirect_to user_url(params[:user_id])
    else
      flash.now[:errors] = @goal.errors.full_messages
      render :new
    end
  end

  def edit
    @goal = Goal.find_by(id: params[:id])
    # fail
    render :edit
  end

  def update
    @goal = Goal.find_by(id: params[:id])
    @user = User.find_by(id: @goal.user_id)
    @goal.update_attributes(goal_params)
    redirect_to user_goal_url(@user.id, @goal.id)
  end

  def show
    @goal = Goal.find_by(id: params[:id])
    render :show
  end

  def destroy
    @goal = Goal.find_by(id: params[:id])
    @user = User.find_by(id: @goal.user_id)

    @goal.destroy
    redirect_to user_url(@user)
  end

  private

  def goal_params
    params.require(:goal).permit(:user_id, :goal_content, :goal_type, :completed)
  end
end