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
  end

  def update
  end

  def show
    @goal = Goal.find_by(id: params[:id])
    render :show
  end

  def destroy
  end

  private

  def goal_params
    params.require(:goal).permit(:user_id, :goal_content, :goal_type, :completed)
  end
end