class PetsController < ApplicationController
  def new
    @pet = Pet.new
    authorize @pet
  end

  def create
    @pet = Pet.new(pet_params)
    authorize @pet
    @pet.user = current_user
    @pet.save
    redirect_to pet_path(@pet)
  end

  def show
  end

  def pet_params
    params.require(:pet).permit(:name, :description, :picture, :location, :species)
  end
end
