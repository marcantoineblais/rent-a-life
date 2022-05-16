class CreateLives < ActiveRecord::Migration[6.1]
  def change
    create_table :lives do |t|
      t.string :title
      t.string :description
      t.float :price

      t.timestamps
    end
  end
end
