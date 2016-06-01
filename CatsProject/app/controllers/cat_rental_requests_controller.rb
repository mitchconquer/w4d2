class CatRentalRequestsController < ApplicationController
  def new
    @cat_rental_request = CatRentalRequest.new
  end

  def index
    @cat_rental_requests = CatRentalRequest.all
  end

  def create
    @cat_rental_request = CatRentalRequest.new(cat_rental_request_params)
    # fail
    if @cat_rental_request.save
      redirect_to cat_rental_requests_url
    else
      render :new
    end
  end

  def show
    @cat_rental_request = CatRentalRequest.find(params[:id])
  end

  def edit
    @cat_rental_request = CatRentalRequest.find(params[:id])
  end

  def update
    @cat_rental_request = CatRentalRequest.find(params[:id])
    @cat_rental_request.update_attributes(cat_rental_request_params)
    if @cat_rental_request.save
      render cat_rental_request_url
    else
      render :edit
    end
  end

  private
  def cat_rental_request_params
    params.require(:cat_rental_request).permit(:start_date, :end_date, :cat_id)
  end
end
