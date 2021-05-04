class RequestsController < ApplicationController
  before_action :find_request, only: %i[show edit update destroy]

  def new
    @request = Request.new
    @offer = Offer.find_by(id: params[:offer_id])
    authorize @request
  end

  def create
    @request = Request.new(request_params)
    @offer = Offer.find(params[:offer_id])
    @request.offer = @offer
    authorize @request
    @request.user = current_user
    if @request.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    authorize @request
    @request.status = "accepted"
    @request.save
    @offer = Offer.find(params[:offer_id])
    @offer.requests.where(status: "open").destroy_all
    redirect_to dashboard_path
  end

  private

  def find_request
    @request = Request.find(params[:id])
  end

  def request_params
    params.require(:request).permit(:message)
  end
end
