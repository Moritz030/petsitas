class OffersController < ApplicationController

  def index
    offers = policy_scope(Offer)
    @offers_searched_by_species = offers.select do |offer|
      offer.pet.species.downcase == params[:species].downcase
    end
    @offers_searched_by_location = @offers_searched_by_species.select do |offer|
      offer.pet.location.downcase == params[:location].downcase
    end

    @offers_search = @offers_searched_by_location
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