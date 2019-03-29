class CatsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @cats = Cat.all

    render :index
  end

  def show
    @cat = Cat.find_by(id: params[:id])

    render :show
  end

  def new
    @cats = Cat.all

    render :new
  end

  def create
    Cat.create!(cat_params)
    redirect_to cats_url
  end

  def edit
  end

  private

  def cat_params
    params.require(:cat).permit(:birth_date, :color, :name, :sex, :description)
  end
end