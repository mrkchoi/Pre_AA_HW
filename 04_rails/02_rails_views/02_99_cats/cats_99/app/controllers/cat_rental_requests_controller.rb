class CatRentalRequestsController < ApplicationController
  skip_before_action :verify_authenticity_token

  # def index
  #   @cat_rental_requests = CatRentalRequest.all.order(start_date: :asc)
  # end
  
  def new
    @cats = Cat.all
    render :new
  end

  def create
    @cat_request = CatRentalRequest.new(cat_rental_requests_params)

    if @cat_request.save
      redirect_to cat_url(@cat_request)
    else
    end
  end

  private

  def cat_rental_requests_params
    params.require(:cat_rental_request).permit(:cat_id, :start_date, :end_date)
  end
end