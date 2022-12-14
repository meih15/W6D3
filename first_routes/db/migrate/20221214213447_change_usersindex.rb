class ChangeUsersindex < ActiveRecord::Migration[7.0]
  def change
    add_index :users, :username
    add_index :artworks, :title
  end
end
