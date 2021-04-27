class AddPetToOffers < ActiveRecord::Migration[6.0]
  def change
    add_reference :offers, :pet, null: false, foreign_key: true
  end
end
