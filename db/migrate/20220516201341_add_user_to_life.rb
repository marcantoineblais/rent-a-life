class AddUserToLife < ActiveRecord::Migration[6.1]
  def change
    add_reference :lives, :user, foreign_key: true
  end
end
