class AddImageInLife < ActiveRecord::Migration[6.1]
  def change
    add_column :lives, :image_url, :string
  end
end
