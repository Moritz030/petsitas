class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: :home
  def home
  end

  def dashboard
    @pets = current_user.pets
    @offers = current_user.offers
    @requests = current_user.requests
  end
end
