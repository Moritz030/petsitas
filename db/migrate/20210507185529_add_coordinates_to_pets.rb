class AddCoordinatesToPets < ActiveRecord::Migration[6.0]
  def change
    add_column :pets, :longitude, :float
    add_column :pets, :latitude, :float
  end
end
