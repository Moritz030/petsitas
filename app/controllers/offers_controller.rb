class OffersController < ApplicationController

  def index
    @offers = policy_scope(Offer)
  end

  
#   private
#   def get_params
#     params.request {"species"=>"asd", "location"=>"yX", "start_date"=>"0111-11-11", "end_date"=>"0001-11-11"}
#    end
end