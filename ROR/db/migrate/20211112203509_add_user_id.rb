class AddUserId < ActiveRecord::Migration[6.1]
  def change
    add_column :labs, :user_id, :integer
    add_foreign_key :labs, :users
  end
end
