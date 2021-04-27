class AddOfferToRequests < ActiveRecord::Migration[6.0]
  def change
    add_reference :requests, :offer, null: false, foreign_key: true
  end
end
