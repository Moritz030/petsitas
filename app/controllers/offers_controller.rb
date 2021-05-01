class OffersController < ApplicationController

  def index
    offers = policy_scope(Offer)
    @offers_search = offers.select do |offer|
      offer.pet.species.downcase == params[:species].downcase
    end
  end

  def new
    @offer = Offer.new
    @pet = Pet.find_by(id: params[:pet_id])
    authorize @offer
  end
  def create
    @offer = Offer.new(get_params)
    @pet = Pet.find(params[:pet_id])
    @offer.pet = @pet
    authorize @offer
    if @offer.save
      redirect_to dashboard_path
    else
      render :new
    end
  end
  private
  def get_params
    params.require(:offer).permit(:start_date, :end_date)
  end
end