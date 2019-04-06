class SubsController < ApplicationController
  before_action :require_moderator_privileges, only: [:edit]

  def index
    @subs = Sub.all
    render :index
  end

  def show
    @sub = Sub.find_by(id: params[:id])
    if @sub
      render :show
    else
      redirect_to :index
    end
  end
  
  def create
    if logged_in? && current_user
      @sub = Sub.new(sub_params)
      @sub.moderator_id = current_user.id

      if @sub.save
        redirect_to sub_url(@sub)
      else
        flash.now[:errors] = @sub.errors.full_messages
        render :new
      end
    else
      flash[:errors] = ['Must be logged in to create sub']
      redirect_to new_session_url
    end
  end

  def new
    render :new
  end

  def edit
    @sub = Sub.find_by(id: params[:id])
    render :edit
  end

  def update
    @sub = Sub.find_by(id: params[:id])
    @sub.update_attributes(sub_params)

    if @sub.save
      redirect_to sub_url(@sub)
    else
      flash.now[:errors] = @sub.errors.full_messages
      render :edit
    end
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description, :moderator_id)
  end

  def require_moderator_privileges
    @sub = Sub.find_by(id: params[:id])
    # fail
    if current_user.id != @sub.moderator_id
      flash.now[:errors] = ['You must be the moderator to edit']
      redirect_to sub_url(@sub)
    end
  end
end