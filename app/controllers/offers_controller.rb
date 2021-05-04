class OffersController < ApplicationController
  def index
    @offers = policy_scope(Offer)
    unless params[:species].blank?
      @offers = @offers.select do |offer|
        offer.pet.species.downcase == params[:species].downcase
      end
    end
    unless params[:location].blank?
      @offers = @offers.select do |offer|
        offer.pet.location.downcase == params[:location].downcase
      end
    end
    unless params[:start_date].blank?
      @offers = @offers.select do |offer|
        # if offer.start_date >  && offer.end_date
        start_date = Date.parse(params[:start_date])
        start_date <= offer.start_date
        # raise
      end
    end
    unless params[:end_date].blank?
      @offers = @offers.select do |offer|
        end_date = Date.parse(params[:end_date])
        end_date >= offer.end_date
      end
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

  def destroy
    @offer = Offer.find(params[:id])
    authorize @offer
    @offer.destroy
    redirect_to dashboard_path
  end

  private

  def get_params
    params.require(:offer).permit(:start_date, :end_date)
  end
end
