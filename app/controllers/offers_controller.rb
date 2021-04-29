class OffersController < ApplicationController

  def index
    @offers = policy_scope(params)
  end

  
  private
#   def get_params
#     {"species"=>"asd", "location"=>"yX", "start_date"=>"0111-11-11", "end_date"=>"0001-11-11"}
#   end
end
