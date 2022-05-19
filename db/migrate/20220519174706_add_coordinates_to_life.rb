class AddCoordinatesToLife < ActiveRecord::Migration[6.1]
  def change
    add_column :lives, :latitude, :float
    add_column :lives, :longitude, :float
    add_column :lives, :address, :string
  end
end
